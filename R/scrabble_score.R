#' Calculate the Scrabble score
#'
#' Calculate the Scrabble score for a word or a vector of words in a given language.
#'
#' @param words A character value or a character vector
#' @param lang The language to base the score on. Currently English (en) and
#'   German (de) are supported
#' @param ignore_whitespace Boolean. Shall whitespace be removed from words before
#'   calculating the score? If FALSE (the default), any whitespace will result in
#'   an NA value
#' @param ignore_invalid_characters Boolean. Shall characters which are not part
#' of the language's Scrabble alphabet be ignored (i.e. 0 points)?
#'   If FALSE (the default), any whitespace will result in an NA value
#'
#' @return A named vector of the same length as `words` with the Scrabble score
#'   for each word
#' @export
#'
#' @examples
#'   scrabble_score("rstats")
#'   scrabble_score(c("rstats", "package"))
scrabble_score <- function(words,
                           ignore_whitespace = FALSE,
                           ignore_invalid_characters = FALSE,
                           lang = c("de", "en")) {
  stopifnot("Language currently not supported." = lang %in% supported_languages())
  if (missing(lang)) lang <- "de"
  words2 <- words
  if (ignore_whitespace) {
    words2 <- gsub("\\s", "", words2)
  }
  if (ignore_invalid_characters) {
    invalid_letters_regex <- paste0(
      "[^",
      paste(names(letter_scores[["de"]]), collapse = ""),
      "]")
    words2 <- gsub(invalid_letters_regex, "", words2)
  }
  l <- strsplit(words2, split = "")
  scores <- sapply(l, score, lang = lang)
  names(scores) <- words
  scores
}

#' Title
#'
#' @param x a character vector
#' @param lang The language to base the score on. Currently only German (de) supported
#'
#' @return The Scrabble score for the input character vector
score <- function(x, lang) {
  x <- toupper(x)
  sum(letter_scores[[lang]][x])
}
