# ---
# title: "Intégrer Julia dans Hugo avec Literate.jl"
# date: 2022-08-05T15:26:35+02:00
# lastmod: 2022-08-05T15:26:35+02:00
# draft: false
# author: "Brian SINQUIN"
# authorLink: "https://www.linkedin.com/in/brian-sinquin/"
# description: "Un test"
#
# tags: []
# categories: ["informatique","programmation"]
#
# hiddenFromHomePage: false
# hiddenFromSearch: false
#
#
#
# toc:
#   enable: true
#
# lightgallery: false
# license: "MIT"
# ---
#
# <!--more-->
#
# ## En cours d'écriture ✍️

# Ceci est un exemple de code julia et son résultat une fois exécuté
using Plots

x = 1:0.1:10
y = sin.(x)

plot(x,y)
