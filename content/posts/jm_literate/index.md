---
title: "Integrer Julia dans Hugo avec Literate.jl"
date: 2022-08-04
lastmod: 2022-08-04
draft: false
author: "Brian SINQUIN"
authorLink: "https://www.linkedin.com/in/brian-sinquin/"
description: "Un test"

tags: []
categories: ["informatique","programmation"]

hiddenFromHomePage: false
hiddenFromSearch: false



toc:
  enable: true

lightgallery: false
license: "MIT"
---

<!--more-->

## En cours d'écriture ✍️

Ceci est un exemple de code julia et son résultat une fois exécuté

````julia
using Plots
gr()
x = 1:0.1:10
y = sin.(x)

plot(x,y, fmt = :png)
````
![](8327836.svg)

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

