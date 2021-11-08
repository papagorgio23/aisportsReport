#' Top betting days
#'
#' @param days Numeric - Number of days
#'
#' @return A tibble - The most profitable days betting
#'
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' best_days(5)
best_days <- function(days = 10) {
  # Error handling
  if (!is.numeric(days)) {
    stop("days must be numeric")
  }

  # load data
  data <- suppressWarnings(
    googlesheets4::read_sheet(
      "1ztHlCjEtcgsWEgap8Cx1IIYIib9e1Pm5aj4Wmi_Y64c",
      col_types = "Dccccccccccnccncnnnnncccllll"
    )
  )

  # get daily totals
  data <- data %>%
    dplyr::group_by(.data$Date) %>%
    dplyr::summarise(
      Bets = dplyr::n(),
      Risks = sum(.data$Risk, na.rm = TRUE),
      Payout = sum(.data$Payout, na.rm = TRUE)
    ) %>%
    dplyr::slice_max(order_by = .data$Payout, n = days) %>%
    dplyr::mutate(
      ROI = .data$Payout / .data$Risks,
      Risks = scales::dollar(.data$Risks, accuracy = 1),
      Payout = scales::dollar(.data$Payout, accuracy = 1),
      ROI = scales::percent(.data$ROI, accuracy = 0.01)
    )

  return(data)
}
