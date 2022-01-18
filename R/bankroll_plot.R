#' Bankroll Plot
#'
#' @param prev_months Numeric - Number of Months back from today that will be included
#' @param league String - Leagues to include in the analysis
#'
#' @return A tibble - The most profitable days betting
#'
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' bankroll_plot(months = 5)
bankroll_plot <- function(prev_months = 24, league = "ALL") {
  # Error handling
  if (!is.numeric(prev_months)) {
    stop("prev_months must be numeric")
  }

  # load data
  data <- suppressWarnings(
    googlesheets4::read_sheet(
      "1ztHlCjEtcgsWEgap8Cx1IIYIib9e1Pm5aj4Wmi_Y64c",
      col_types = "Dccccccccccnccncnnnnncccllll"
    )
  )

  # handle leagues
  if (league != "ALL") {
    data <- data %>%
      dplyr::filter(.data$League %in% league)
  }

  # get daily totals
  data <- data %>%
    dplyr::filter(.data$Date > lubridate::add_with_rollback(
      lubridate::today(), months(-prev_months))
    ) %>%
    dplyr::group_by(.data$Date) %>%
    dplyr::summarise(
      Bets = dplyr::n(),
      Risks = sum(.data$Risk, na.rm = TRUE),
      Payout = sum(.data$Payout, na.rm = TRUE)
    ) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(Bankroll = cumsum(Payout))

  # Plot
  ggplot2::ggplot(data, ggplot2::aes(x=Date, y=Bankroll)) +
    ggplot2::geom_area(fill="#69b3a2", alpha=0.4) +
    ggplot2::geom_line(color="#69b3a2", size=2) +
    ggplot2::geom_point(size=3, color="#69b3a2") +
    ggplot2::scale_y_continuous(labels=scales::dollar_format()) +
    ggplot2::labs(
      title = "A.I. Sports Profit",
      caption = "A.I. Sports",
      x = "",
      y = "Profit"
    ) +
    ggplot2::theme_bw()

  return(data)
}
