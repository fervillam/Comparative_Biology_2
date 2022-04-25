#### 6.3 Analysis of Diversification ####
#### (a modification of (Paradis, 2012), page 258) ####

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

# Tree calibration using Mus-Rattus divergence

rodent_calibrated <- chronopl(rodent_ultra_tree, lambda = 2, age.min = 12)

### Graphical Methods ###

## Fig. 6.11.1 ##

# Lineages-through-time plot of the clock tree of Michaux et al.

layout(matrix(1:2, 1, 2))
ltt.plot(rodent_ultra_tree)
ltt.plot(rodent_ultra_tree, log = "y") # Log scale
dev.off()

## Fig. 6.11.2 ##

# Adding a lineages-through-time plot on an existing graph
ltt.plot(rodent_ultra_tree)
ltt.lines(rodent_calibrated, lty = 2)
dev.off()

## Fig. 6.12 ##

# A better way of plotting several lineages-through-time plots on the same graph

mltt.plot(rodent_ultra_tree, rodent_calibrated, dcol = FALSE, dlty = TRUE)
dev.off()

### The Simple Birth-Death and Yule Models ###

## Simple Birth-Death Model ##

birth_death_rodent <- birthdeath(rodent_ultra_tree)
birth_death_rodent

