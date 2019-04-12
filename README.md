
<!-- README.md is generated from README.Rmd. Please edit that file -->

# feasts.tsfresh

[![Travis build
status](https://travis-ci.org/mitchelloharawild/feasts.tsfresh.svg?branch=master)](https://travis-ci.org/mitchelloharawild/feasts.tsfresh)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

This package makes the feature functions offered by
[tsfresh](https://github.com/blue-yonder/tsfresh) available in R. It
uses a structure suitable for use with the \`features() function from
[feasts](https://github.com/tidyverts/feasts). This package makes use of
the Python package [tsfresh](https://github.com/blue-yonder/tsfresh) via
the [reticulate](https://github.com/rstudio/reticulate) package.

## Installation

You can install the development version of feasts.tsfresh from
[Github](https://github.com/mitchelloharawild/feasts.tsfresh) with:

``` r
devtools::install_github("mitchelloharawild/feasts.tsfresh")
feasts.tsfresh::install_tsfresh()
```

## Example

``` r
library(tsibble)
library(feasts)
library(feasts.tsfresh)

tsibbledata::aus_retail %>% 
  filter(Industry == "Food retailing") %>% 
  features(Turnover, features = tsfresh_features)
#> # A tibble: 8 x 796
#>   State Industry x__abs_energy x__absolute_sum… `x__agg_autocor…
#>   <chr> <chr>            <dbl>            <dbl>            <dbl>
#> 1 Aust… Food re…      5721057.            2202.            0.903
#> 2 New … Food re…   1522160448.           42850.            0.886
#> 3 Nort… Food re…      2214058.            1415.            0.859
#> 4 Quee… Food re…    634633214.           23860.            0.905
#> 5 Sout… Food re…     80419121.           10424.            0.895
#> 6 Tasm… Food re…      7370701.            3083.            0.869
#> 7 Vict… Food re…    924173789.           33904.            0.889
#> 8 West… Food re…    195927812.           15506.            0.903
#> # … with 791 more variables:
#> #   `x__agg_autocorrelation__f_agg_"median"__maxlag_40` <dbl>,
#> #   `x__agg_autocorrelation__f_agg_"var"__maxlag_40` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_10__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_10__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_10__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_10__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_50__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_50__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_50__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_50__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_5__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_5__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_5__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"max"__chunk_len_5__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_10__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_10__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_10__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_10__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_50__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_50__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_50__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_50__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_5__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_5__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_5__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"mean"__chunk_len_5__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_10__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_10__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_10__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_10__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_50__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_50__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_50__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_50__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_5__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_5__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_5__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"min"__chunk_len_5__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_10__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_10__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_10__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_10__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_50__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_50__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_50__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_50__attr_"stderr"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_5__attr_"intercept"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_5__attr_"rvalue"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_5__attr_"slope"` <dbl>,
#> #   `x__agg_linear_trend__f_agg_"var"__chunk_len_5__attr_"stderr"` <dbl>,
#> #   x__approximate_entropy__m_2__r_0.1 <dbl>,
#> #   x__approximate_entropy__m_2__r_0.3 <dbl>,
#> #   x__approximate_entropy__m_2__r_0.5 <dbl>,
#> #   x__approximate_entropy__m_2__r_0.7 <dbl>,
#> #   x__approximate_entropy__m_2__r_0.9 <dbl>,
#> #   x__ar_coefficient__k_10__coeff_0 <dbl>,
#> #   x__ar_coefficient__k_10__coeff_1 <dbl>,
#> #   x__ar_coefficient__k_10__coeff_2 <dbl>,
#> #   x__ar_coefficient__k_10__coeff_3 <dbl>,
#> #   x__ar_coefficient__k_10__coeff_4 <dbl>,
#> #   `x__augmented_dickey_fuller__attr_"pvalue"` <dbl>,
#> #   `x__augmented_dickey_fuller__attr_"teststat"` <dbl>,
#> #   `x__augmented_dickey_fuller__attr_"usedlag"` <dbl>,
#> #   x__autocorrelation__lag_0 <dbl>, x__autocorrelation__lag_1 <dbl>,
#> #   x__autocorrelation__lag_2 <dbl>, x__autocorrelation__lag_3 <dbl>,
#> #   x__autocorrelation__lag_4 <dbl>, x__autocorrelation__lag_5 <dbl>,
#> #   x__autocorrelation__lag_6 <dbl>, x__autocorrelation__lag_7 <dbl>,
#> #   x__autocorrelation__lag_8 <dbl>, x__autocorrelation__lag_9 <dbl>,
#> #   x__binned_entropy__max_bins_10 <dbl>, x__c3__lag_1 <dbl>,
#> #   x__c3__lag_2 <dbl>, x__c3__lag_3 <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.2__ql_0.0` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.2__ql_0.2` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.2__ql_0.4` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.2__ql_0.6` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.2__ql_0.8` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.4__ql_0.0` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.4__ql_0.2` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.4__ql_0.4` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.4__ql_0.6` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.4__ql_0.8` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.6__ql_0.0` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.6__ql_0.2` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.6__ql_0.4` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.6__ql_0.6` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.6__ql_0.8` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.8__ql_0.0` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.8__ql_0.2` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.8__ql_0.4` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.8__ql_0.6` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_0.8__ql_0.8` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_1.0__ql_0.0` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_1.0__ql_0.2` <dbl>,
#> #   `x__change_quantiles__f_agg_"mean"__isabs_False__qh_1.0__ql_0.4` <dbl>,
#> #   …
```
