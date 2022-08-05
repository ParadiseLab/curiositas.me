# ---
# title: "Integrer Julia dans Hugo avec Literate.jl"
# date: 2022-08-04
# lastmod: 2022-08-04
# draft: false
# author: "Brian SINQUIN"
# authorLink: "https://www.linkedin.com/in/brian-sinquin/"
# description: "La puissance de julia dans un site serverless"
#
# tags: ["julia"]
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
# ## Introduction
#
# Julia est un langage de programmation de plus en plus en vogue dans le milieu scientifique et de manière générale. Il combine la rapidité du C/C++ grâce à la **compilation à la volée** (**JIT**: Just-In-Time Compilation) ainsi que l'abstraction et la souplesse syntaxique de **python**.
# L'écosystème de ce language s'est développé au cours des dernières années, on peut notamment faire tourner *julia* sur des notebook Jupyter et l'exporter vers le web via l'utilisation de paquets adéquats : **Documenter.jl**, **Books.jl**, Franklin.jl, **Literate.jl** etc.).
#
# J'aimerai moi aussi pouvoir intégrer des blocs de code julia dans mes articles, mais celui-ci est généré de manière statique à l'aide de Hugo, qui ne fait pas parti de l'écosystème julia.
# Hugo est un moteur de génération html qui prend des documents markdown comme source de contenu (tout mes articles sont en réalité des fichiers markdown). Hugo s'occupe de générer la structure du site, les hyperliens, et le style CSS.
#
#
# Heureusement il existe un paquet Julia permettant de transformer un fichier de ce language vers le markdown tout en exécutant le code et en rendant compte du résultat dde cette execution.
# C'est **Literate.jl** que nous allons utilisé par la suite pour automatiser l'intégration de julia dans un site Hugo.
# **Literate.jl** ne voit qu'un fichier julia, il va lire directement le code à exécuter. Pour afficher du markdown directement celui-ci doit être écrit en commentaire julia. C'est-à-dire, après un dièse où en commentaire multi-ligne.
# ## Exemples
#
# Si mon fichier `exemple.jl` contient le code suivant :
# ```julia
# # Markdown
# using Plots
#
# x = -10:0.01:10
# y = sinc.(x)
#
# plot(x,y, color=:black, lw=1);
# savefig("image.png")
#
# # ![figure](image.png)
# ```
#
# Literate.jl me génère un fichier markdown dont le rendu est visible ci-dessous :

using Plots

x = -10:0.01:10
y = sinc.(x)

plot(x,y, color=:black, lw=1);
savefig("image.png")

# ![figure](image.png)

# On voit bien que le code est affiché dans un bloc et qu'on peut afficher l'image `image.png` qui a été générée durant l’exécution du code.
# On peut afficher autre chose que des images :
A = [[1, 2 , 3], [4, 5, 6], [7, 8, 9]]

# On peut également cacher le code exécuté en ajoutant le commentaire `#hide` après chaque ligne de code.
# ```julia
# # Markdown
# using Plots                     #hide
# x = -10:0.01:10                 #hide
# y = -sinc.(x)                   #hide
# plot(x,y, color=:red, lw=1);    #hide
# savefig("image2.png")           #hide

# # ![figure](image2.png)
# ```
using Plots                     #hide
x = -10:0.01:10                 #hide
y = -sinc.(x)                   #hide
plot(x,y, color=:red, lw=1);    #hide
savefig("image2.png")           #hide

# ![figure](image2.png)
# ## Comment faire ?

#
# J'utilise un système de génération automatisé (Github Workflow) pour mon site, mais la méthode reste la même de manière générale.
# Il faut utiliser Literate.jl pour transformé un fichier `.jl` en fichier markdown dans le dossier du contenu du site. Ensuite, il faut lancer la commande de Hugo qui permet de générer les source HTML du site.
#
# C'est donc sur cette première étape que je vais m'attarder. Les fichiers des articles en markdown de Hugo sont situé dans le dossier `content/posts`. C'est ici que l'on voudra demander à Literate.jl d'enregistrer les fichier qu'il a converti.
# Nous créons un dossier `julia` qui contiendra les source julia.
#
# L'algorithme que nous voulons mettre en place est le suivant :
# 1. Faire une liste des anciens fichiers markdown issues de la conversion (mise-à-jour d'articles)
# 2. Supprimer ces fichier
# 3. Faire une liste des fichier julia à convertir
# 4. Générer le chemin de destination pour chacun d'eux
# 5. Utiliser Literate.jl
#
# Voici ce que cela donne :
# ```julia
# using Pkg;
#
# Pkg.add("Literate")
# Pkg.add("Plots") # dépendance utile
#
# using Literate, Plots
#
# PREFIX = "jm_" # prefix des dossiers générés afin de ne pas supprimer les contenus markdown (ne provenant pas de julia)
# JMD = joinpath("../",@__DIR__, "julia") # chemin de nos sources
# MD_OUTPUT = joinpath(@__DIR__, "content", "posts") # chemin de destination
#
# for file in readdir(MD_OUTPUT, join=false) # pour chaque sous-dossier dans le contenu
#     if startswith(file, PREFIX) # vérifier que chacun commence par le prefix
#         rm(joinpath(MD_OUTPUT,file), recursive=true) # si oui, le supprimer
#     end
# end
#
#
# for file in readdir(JMD; join=false) # pour chaque fichier source
#     endswith(file, ".jl") || continue # vérifier que c'est un fichier julia
#     Literate.markdown(joinpath(JMD,file), joinpath(MD_OUTPUT,PREFIX*file[1:end-3]), name="index"; execute=true, flavor = Literate.CommonMarkFlavor())
#     # demander à Literale.jl la conversion à la destination content/posts/{nom_du_fichier_jl}/index.md
# end
# ```

# Il suffira ensuite de générer le site à l'aide d'Hugo, à vous de jouer.
