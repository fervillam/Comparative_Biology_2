### 6.3 Analysis of Diversification ###
### (a modification of Paradis, 2012, page 258) ###

# Setting work directory

setwd("/home/usuario/Documents/Comparada II")

# Installing required packages

if(!require("ape")){
  install.packages("ape")
}

if(!require("phytools")){
  install.packages("phytools")
}

# Loading required packages
      
library(ape)

library(phytools)

# Load a tree using read.tree()
rodent_tree <- read.tree("rodent.tree")

# Is the tree ultrametric?
is.ultrametric(rodent_tree)
  # FALSE

# If false, force ultrametricity
rodent_ultra_tree <- force.ultrametric(rodent_tree)

# It is now ultrametric?
is.ultrametric(rodent_ultra_tree)
  # TRUE


## Fig 6.11 ##
# Lineages-through-time plot of the clock tree of Michaux et al.

layout(matrix(1:2, 1, 2))
ltt.plot(rodent_ultra_tree)
ltt.plot(rodent_ultra_tree, log = "y")
