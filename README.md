
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aisportsReport

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/papagorgio23/aisportsReport.svg?branch=master)](https://travis-ci.com/papagorgio23/aisportsReport)
<!-- badges: end -->

The goal of *aisportsReport* is to create all of A.I. Sports’ reporting.

## Installation

You can install the released version of aisportsReport from
[GitHub](https://github.com/papagorgio23/aisportsReport) with:

``` r
# install.packages("devtools")
devtools::install_github("papagorgio23/aisportsReport")
#> 
#>      checking for file ‘/private/var/folders/rd/f5l78t4x02j84hk956p6fdlw0000gn/T/RtmpfaTqUc/remotes14d2d793c9cc2/papagorgio23-aisportsReport-8a78f3f/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/rd/f5l78t4x02j84hk956p6fdlw0000gn/T/RtmpfaTqUc/remotes14d2d793c9cc2/papagorgio23-aisportsReport-8a78f3f/DESCRIPTION’
#>   ─  preparing ‘aisportsReport’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>      Omitted ‘LazyData’ from DESCRIPTION
#>   ─  building ‘aisportsReport_0.0.0.9000.tar.gz’
#>      
#> 
```

## Example

This is a basic example which shows you the top 20 best days betting and
the worst 20:

``` r
library(aisportsReport)

# get best days betting
knitr::kable(best_days(20))
```

| Date       | Bets | Risks    | Payout  | ROI     |
|:-----------|-----:|:---------|:--------|:--------|
| 2021-05-03 |   34 | $89,880  | $70,849 | 78.83%  |
| 2021-05-09 |   34 | $65,595  | $54,445 | 83.00%  |
| 2021-04-13 |   40 | $42,000  | $42,751 | 101.79% |
| 2021-04-22 |   16 | $34,170  | $42,272 | 123.71% |
| 2021-04-08 |   28 | $46,250  | $37,982 | 82.12%  |
| 2021-04-17 |   53 | $67,163  | $35,206 | 52.42%  |
| 2021-03-22 |   31 | $30,601  | $31,465 | 102.82% |
| 2021-04-24 |   55 | $64,660  | $30,589 | 47.31%  |
| 2021-04-15 |   25 | $40,545  | $29,294 | 72.25%  |
| 2021-04-25 |   73 | $100,769 | $25,106 | 24.91%  |
| 2021-03-15 |   18 | $16,738  | $24,508 | 146.42% |
| 2021-05-26 |   12 | $20,282  | $23,768 | 117.19% |
| 2021-04-11 |   61 | $69,247  | $20,239 | 29.23%  |
| 2021-04-28 |   21 | $47,285  | $19,293 | 40.80%  |
| 2021-05-24 |    8 | $14,316  | $19,228 | 134.31% |
| 2021-01-24 |   54 | $25,430  | $19,111 | 75.15%  |
| 2021-03-21 |   47 | $53,526  | $16,487 | 30.80%  |
| 2021-03-23 |   20 | $16,347  | $16,419 | 100.44% |
| 2021-03-25 |   14 | $14,824  | $16,135 | 108.84% |
| 2021-03-12 |   49 | $38,057  | $14,016 | 36.83%  |

``` r
# get worst days betting
knitr::kable(worst_days(20))
```

| Date       | Bets | Risks   | Payout   | ROI      |
|:-----------|-----:|:--------|:---------|:---------|
| 2021-05-06 |    9 | $30,660 | -$30,660 | -100.00% |
| 2021-04-14 |   26 | $39,823 | -$23,459 | -58.91%  |
| 2021-04-05 |   33 | $37,095 | -$22,768 | -61.38%  |
| 2021-04-09 |   36 | $50,766 | -$21,212 | -41.78%  |
| 2021-05-02 |   16 | $46,440 | -$18,300 | -39.41%  |
| 2021-04-20 |   40 | $50,977 | -$17,881 | -35.08%  |
| 2021-05-04 |   20 | $51,320 | -$16,980 | -33.09%  |
| 2021-04-21 |   39 | $70,650 | -$15,549 | -22.01%  |
| 2021-05-12 |    6 | $21,390 | -$15,150 | -70.83%  |
| 2021-05-11 |   17 | $51,405 | -$14,885 | -28.96%  |
| 2021-05-10 |   29 | $69,352 | -$11,166 | -16.10%  |
| 2021-04-26 |   12 | $22,464 | -$11,088 | -49.36%  |
| 2021-04-02 |   25 | $26,505 | -$10,730 | -40.48%  |
| 2021-03-20 |   56 | $53,406 | -$10,669 | -19.98%  |
| 2021-04-16 |   42 | $65,567 | -$10,266 | -15.66%  |
| 2021-02-21 |   30 | $24,544 | -$10,000 | -40.74%  |
| 2021-02-06 |   28 | $16,089 | -$8,977  | -55.80%  |
| 2021-02-20 |   33 | $17,455 | -$8,362  | -47.91%  |
| 2021-04-27 |   32 | $48,071 | -$8,236  | -17.13%  |
| 2021-02-14 |   27 | $17,837 | -$7,456  | -41.80%  |
