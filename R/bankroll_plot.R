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
#' bankroll_plot(prev_months = 4)
bankroll_plot <- function(prev_months = 24, league = "ALL") {
  # Error handling
  if (!is.numeric(prev_months)) {
    stop("prev_months must be numeric")
  }

  if (is.null(data)) {
    # load data
    data <- suppressWarnings(
      googlesheets4::read_sheet(
        "1ztHlCjEtcgsWEgap8Cx1IIYIib9e1Pm5aj4Wmi_Y64c",
        col_types = "Dccccccccccnccncnnnnncccllll"
      )
    )
  }


  # handle leagues
  if (league != "ALL") {
    final_data <- data %>%
      dplyr::filter(.data$League %in% league)
  }

  # get daily totals
  final_data <- data %>%
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
  p <- ggplot2::ggplot(final_data, ggplot2::aes(x=Date, y=Bankroll)) +
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

  sum_data <- final_data %>%
    dplyr::summarise(
      `Total Bets` = sum(Bets),
      `Total Risked` = sum(Risks),
      `Total Profit` = sum(Payout),
    ) %>%
    dplyr::mutate(
      `Total Bets` = scales::number(.data$`Total Bets`, big.mark = ","),
      ROI = .data$`Total Profit` / .data$`Total Risked`,
      `Total Risked` = scales::dollar(.data$`Total Risked`, accuracy = 1),
      `Total Profit` = scales::dollar(.data$`Total Profit`, accuracy = 1),
      ROI = scales::percent(.data$ROI, accuracy = 0.01)
    )

  print(sum_data)

  return(p)
}
