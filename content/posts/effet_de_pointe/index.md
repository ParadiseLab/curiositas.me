---
title: "L'effet de pointe"
subtitle: "Plus c'est pointu, plus ça pique !"
date: 2021-08-18T15:26:35+02:00
lastmod: 2021-08-18T15:26:35+02:00
draft: false
author: "Brian SINQUIN"
authorLink: "https://www.linkedin.com/in/brian-sinquin/"
description: "Explication et démonstration de l'effet de pointe dans les conducteurs (métaux)"

tags: []
categories: ["physique"]

hiddenFromHomePage: false
hiddenFromSearch: false

featuredImage: "thunder_preview.jpg"
featuredImagePreview: "thunder_preview.jpg"


toc:
  enable: true
math:
  enable: true

lightgallery: false
license: "MIT"
---

L'effet de pointe, ou pouvoir de pointe, est la propriété des conducteurs à présenter un champ électrique plus intense sur les extrémités pointus lorsque ceux-ci sont chargés.

<!--more-->

Cet effet est utilisé dans divers applications, la plus connue étant le paratonnerre, qui constitue un objet privilégié pour décharger une atmosphère orageuse par la création d'un éclair. De la même manière, il est préférable d'utiliser deux pointes pour créer un arc électrique, pour des crayons pyrograveurs ou des briquets à plasma par exemple.

## Phénomène physique

D'après le théorème de **Gauss**, dans un conducteur (comme le fer ou l'or), aucune charge électrique ne peut durablement exister dans le volume. En effet, celles-ci se repoussent jusqu'à la surface jusqu'à trouver un équilibre statique des forces (de **Coulomb**) qu'elles exercent les unes sur les autres.

En conséquence, les forces étant équilibrées, le champ électrique est nul à l'intérieur du conducteur et dirigé perpendiculairement à la surface à l'extérieur. Ainsi, sur une boule conductrice chargée, de par sa symétrie, les charges sont uniformément reparties sur la surface. 

Si l'on vient maintenant rajouter une excroissance sur la surface de cette sphère, il y a un déséquilibre des forces et les charges à cet endroit perçoivent en moyenne moins de répulsions que les autres. Plus de charges peuvent s'accumuler à cette endroit, il y a une augmentation locale de la densité surfacique de charge et donc un champ électrique plus fort à l'extérieur de cette excroissance. C'est l'effet de pointe.

## Démonstration par un modèle simple

Imaginons deux boulles métalliques de rayon $R_1$ et $R_2$ présentant à leur surface des charges $Q_1$ et $Q_2$ .

D'après le théorème de **Gauss** :
$$
\oiint_C \epsilon_0 \vec{E} \cdot \vec{dS} = Q
$$

Comme on étudie une sphère le champs électrique est radial et constant sur la surface, et donc colinéaire à l'élément vectoriel de surface. On peut ré-écrire l'expression sous la forme :

$$
\oiint_C E(r) \cdot dS = E(R)\cdot S = Q/\epsilon_0
$$

Finalement on trouve l'expression : $E(R)=\frac{Q}{4\pi \epsilon_0 R^2}$ . On connait donc la valeur des champs à la surface de nos deux boulles :

$$
E_1(R_1)=\frac{Q_1}{4\pi \epsilon_0 R_1^2} \ et\ E_2(R_2)=\frac{Q_2}{4\pi \epsilon_0 R_2^2} 
$$

Gardons à l'esprit qu'à l'intérieur de la boulle, les forces électriques se compensent (on peut le démontrer). On aurait donc $E(r<R)=0$ . À l'extérieur de la boulle la valeur du champ décroit comme l'inverse de la distance au carré comme la force d'attraction gravitationnelle.

On calcul ensuite le potentiel électrique à partir du champs :

$$
E(r) = - \frac{dV}{dr}
$$

$$
V(R) = -\int E(r)dr = -\frac{Q}{4\pi \epsilon_0 R} = -E(R)\cdot R
$$

On remarque qu'à l'extérieur des boulles, le potentiel évolue comme l'inverse de la distance $R$, à l'intérieur de la boulle le potentiel est constant en revanche.

Pour nos deux boulles on a donc :

$$
V_1(R_1) = -E_1(R_1)\cdot R_1\ et\ V_2(R_2) = -E_2(R_2)\cdot R_2
$$

Considérons maintenant nos deux boulles comme appartenant à un seul solide conducteur, en les mettant en contact :

{{< figure src="schema_pointe.svg" caption="Schéma de principe" >}}

Dans cette configuration où les surface se touchent, le potentiel à la surface des boulles est le même, on a donc : $V_1(R_1)=V_2(R_2)$.
En transformant cette expression on peut exprimer le champ électrique à la surface de la boulles $1$ par rapport à la boulle $2$.

$$
\color{red}{E_2 = \frac{R_1}{R_2} E_1}
$$

C'est cette expression finale qui nous permet de conclure sur l'effet de pointe. En effet, si la boulle $2$ est la plus petite, c'est-à-dire $R_2 < R_1$, on dira qu'elle constitue la pointe du système. On peut conclure à partir de l'expression que le champ $E_2$ à proximité de la pointe est plus fort qu'à proximité de l'autre boulle. On a bien démontré l'effet.

{{< figure src="https://upload.wikimedia.org/wikipedia/commons/8/85/Effet_pointe.png" caption="[Effet de pointe (Wikipedia Commons)](https://fr.wikipedia.org/wiki/Effet_de_pointe#/media/Fichier:Effet_pointe.png)" >}}

## Bibliographie

[Cours, Unisciel](https://uel.unisciel.fr/physique/elecstat/elecstat_ch08/co/apprendre_ch08_02.html)

[Plateforme Ampère, CNRS](http://www.ampere.cnrs.fr/parcourspedagogique/zoom/coulomb/memoire/consequences.php)

[femto-physique.fr](https://femto-physique.fr/electromagnetisme/conducteurs-electriques.php)