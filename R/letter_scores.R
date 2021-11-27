letter_scores <- list()

# German (de)
letter_scores[["de"]] <- c(
  1, 3, 4, 1, 1, 4, 2, 2,
  1, 6, 4, 2, 3, 1, 2, 4,
 10, 1, 1, 1, 1, 6, 3, 8,
 10, 3, 6, 6, 8
)
names(letter_scores[["de"]]) <- toupper(
  c(letters, c("ä", "ö", "ü"))
  # c(letters, c("\\u00E4", "\\u00F6", "\\u00FC"))
  )


# English (en)
letter_scores[["en"]] <- c(
  1, 3, 3, 2, 1, 4, 2, 4,
  1, 8, 5, 1, 3, 1, 0, 3,
 10, 1, 1, T, 1, 4, 4, 8,
  4, 10
)
names(letter_scores[["en"]]) <- toupper(letters)


# Source: https://en.wikipedia.org/wiki/Scrabble_letter_distributions
