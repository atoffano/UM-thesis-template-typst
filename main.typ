// --- VARIABLES ---
#import "metadata.typ": *
// --- CONFIGURATION GLOBALE ---

// 1. Métadonnées
#set document(
  title: thesis_title, 
  author: author_name
)

// 2. Configuration de la page et des marges
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  header: align(right)[#text(size: 8pt, style: "italic")[#thesis_title]],
  footer: context [
    // Grid pour placer le numéro au centre et le texte à droite
    #grid(
      columns: (1fr, auto, 1fr), // Trois colonnes : espace, numéro, texte
      align: (left, center, right), // Alignement de chaque colonne
      [], // Colonne gauche vide
      counter(page).display("1"),
      text(size: 8pt)[Université de Montpellier]
    )
  ]
)

// 3. Typographie
#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "fr"
)
#set heading(numbering: "1.1") // Format de la numérotation des sections / sous-sections (e.g. 1.1 ou A.1, etc.)
#show heading: set block(above: 2em, below: 1em) // Espacement autour des titres
#show link: set text(fill: rgb("#000080")) // Hyperlinks colorés
#set math.equation(numbering: "(1)") // Numérotation des équations

// Paragraphes
#set par(
  leading: 0.65em,
  justify: true,
)

// --- CONSTRUCTION DU DOCUMENT ---
// 1. Page de Titre
// On désactive temporairement l'en-tête, le base de page et la numérotation pour la couverture
#page(
  numbering: none, 
  header: none, 
  footer: none,
  background: image("assets/global/bg_um.jpg", width: 100%, height: 100%),
  margin: (x: 2.5cm, y: 2.5cm)
)[
  #include "chapters/00-frontpage.typ"
]

// 2. Pages Liminaires
#include "chapters/00-liminar.typ"
#pagebreak()

// 5. Table des Matières
#outline(
  title: "Table des matières",
  depth: 3, 
)
#pagebreak()

// Listes - Abbréviations, tableau et figures
#heading(numbering: none)[Liste des abréviations, figures et tableaux]
/ UM: Université de Montpellier
/ CNRS: Centre National de la Recherche Scientifique

#outline(
  title: "Liste des figures",
  target: figure.where(kind: image),
)

#outline(
  title: "Liste des tableaux",
  target: figure.where(kind: table),
)
#pagebreak()


// 6. Corps de la thèse
#include "chapters/01-introduction.typ"
#pagebreak()
// Autres chapitres à rajouter : e.g. #include "chapters/02-background.typ"

// 7. Annexes
#include "chapters/99-appendices.typ"

// 8. Bibliographie
#pagebreak()
#bibliography(
  "bib/references.bib",
  style: "nature", // Ou "apa", "chicago-author-date", etc.
)

// 9. 4e de couverture
#pagebreak()
#include "chapters/99-lastpage.typ"
