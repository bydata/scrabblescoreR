#' Calculate the SCRABBLE score
#'
#' Calculate the SCRABBLE score for a word or a vector of words in a given language.
#'
#' @param words A character value or a character vector
#' @param lang The language to base the score on. Currently English (en) and
#'   German (de) are supported
#' @param ignore_whitespace Boolean. Shall whitespace be removed from words before
#'   calculating the score? If FALSE (the default), any whitespace will result in
#'   an NA value
#'
#' @return A named vector of the same length as `words` with the SCRABBLE score
#'   for each word
#' @export
#'
#' @examples
#'   scrabble_score("rstats")
#'   scrabble_score(c("rstats", "package"))
scrabble_score <- function(words, ignore_whitespace = FALSE, lang = c("de", "en")) {
  stopifnot("Language currently not supported." = lang %in% supported_languages)
  if (missing(lang)) lang <- "de"
  if (ignore_whitespace) {
    words <- gsub("\\s", "", words)
  }
  l <- strsplit(words, split = "")
  scores <- sapply(l, score, lang = lang)
  names(scores) <- words
  scores
}

#' Title
#'
#' @param x a character vector
#' @param lang The language to base the score on. Currently only German (de) supported
#'
#' @return The SCRABBLE score for the input character vector
score <- function(x, lang) {
  x <- toupper(x)
  sum(letter_scores[[lang]][x])
}
