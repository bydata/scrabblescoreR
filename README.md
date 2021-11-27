
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

# scrabblescorer

<!-- badges: start -->
<!-- badges: end -->

Calculate the score a word gains in the game of Scrabble. Currently,
English and German are supported.

## Installation

You can install the development version of scrabblescorer from
[Github](https://github.com/bydata/scrabblescorer) with:

``` r
devtools::install_github("bydata/scrabblescorer")
```

## Example

``` r
library(scrabblescorer)

# get the Scrabble score for one word
scrabble_score("rstats", lang = "en")
#> rstats 
#>      6
scrabble_score("rstats", lang = "de")
#> rstats 
#>      6

# get the Scrabble score for multiple words
words <- c("more", "than", "words")
scrabble_score(words, lang = "en")
#>  more  than words 
#>     5     7     8

# which languages are supported?
supported_languages()
#> [1] "de" "en"
```
