# ---
# title: "Le notbook Julia"
# date: 2022-06-05T15:26:35+02:00
# lastmod: 2022-06-05T15:26:35+02:00
# draft: false
# author: "Brian SINQUIN"
# authorLink: "https://www.linkedin.com/in/brian-sinquin/"
# description: "Un test"
#
# tags: []
# categories: ["physique", "informatique","programmation"]
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
# ## Comming soon ⌚

using Plots

x = 1:0.1:10
y = sin.(x)

plot(x,y);
savefig("plot.png");

# ![Figure](plot.png)
