#' @description Function to round the data properly and not have finicky rounding.
#' @param number The number to round
#' @param digits The digits to round off till
#' @return The rounded number
true_round <- function(
  number,
  digits
) {
  number <- as.numeric(number)
  posneg <- sign(number)
  number <- abs(number) * 10 ^ digits
  number <- number + 0.5 + sqrt(.Machine$double.eps)
  number <- trunc(number)
  number <- number / 10 ^ digits
  number * posneg
}

#' @description function to format price/change values
#' @param value the value to format
#' @param round the digits to round till
#' @param format the number format "d" or "f"
#' @param big the separator for big values, default ","
#' @return the formatted value
format_price <- function(
  value,
  round = 2,
  format = "f",
  big = ","
) {
  formatC(
    as.numeric(
      as.character(true_round(value, round))
    ),
    digits = round,
    format = format,
    big.mark = big
  )
}

#' @description function to shorten the price to colloquial formats
#' @param value the value to shorten
#' @param round the digits to round till
#' @return the shortened value
shorten_price <- function(
  value,
  round = 1
) {
  value <- as.numeric(format_price(value = value, round = 3, big = ""))
  dplyr::case_when(
    value < 1e3 ~ as.character(true_round(value, round)),
    value < 1e6 ~ paste0(as.character(true_round(value / 1e3, round)), "K"),
    value < 1e9 ~ paste0(as.character(true_round(value / 1e6, round)), "M"),
    TRUE ~ paste0(as.character(true_round(value / 1e9, round)), "B")
  )
}

#' @description function to get the class for a value
#' @param value the value to get the class for
#' @param type the type of class to get
#' @return the class
get_css_class <- function(
  value,
  type
) {
  class_list <- list()

  if (value > 0) {
    class_list$text <- "green"
    class_list$light_text <- "light-green"
    class_list$highlight <- "green-background"
  } else if (value < 0) {
    class_list$text <- "red"
    class_list$light_text <- "light-red"
    class_list$highlight <- "red-background"
  } else {
    class_list$text <- "grey"
    class_list$light_text <- "light-grey"
    class_list$highlight <- "grey-background"
  }

  if (type == "all") {
    class_list
  } else if (type %in% c("text", "light-text", "highlight")) {
    as.character(class_list[[type]])
  } else {
    print("type can only be 'text', 'light-text', 'highlight', or 'all'.")
  }
}

#' @description function to preserve zero values
#' @param value the value to preserve
#' @return the preserved value
preserve_zero <- function(value) {
  sprintf(ifelse(value %% 1 == 0, "%.2f", "%.2f"), value)
}


#' @description function to format the date
#' @param date_string the date string to format
#' @return the formatted date
format_date <- function(date_string) {
  as.Date(date_string, format = "%d/%m/%y")
}

#' @description Helper function to get the progress bar colour
#' @param progress_percent The progress percentage
#' @param palette The palette to use
#' @export
get_progress_bar_colour <- function(progress_percent, palette) {
  if (progress_percent >= 0 && progress_percent < 0.25) {
    palette[1]
  } else if (progress_percent >= 0.25 && progress_percent < 0.50) {
    palette[2]
  } else if (progress_percent >= 0.50 && progress_percent < 0.75) {
    palette[3]
  } else {
    palette[4]
  }
}
