
#' Abs energy
#' 
#' 
#' Returns the absolute energy of the time series which is the sum over the squared values
#' 
#' \deqn{E = \sum_{i=1,\ldots, n} x_i^2}
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
abs_energy <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$abs_energy(x)
  `names<-`(out, 'abs_energy')
}

#' Absolute sum of changes
#' 
#' 
#' Returns the sum over the absolute value of consecutive changes in the series x
#' 
#' \deqn{\sum_{i=1, \ldots, n-1} \mid x_{i+1}- x_i \mid}
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
absolute_sum_of_changes <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$absolute_sum_of_changes(x)
  `names<-`(out, 'absolute_sum_of_changes')
}

#' Agg autocorrelation
#' 
#' 
#' Calculates the value of an aggregation function \eqn{f_{agg}} (e.g. the variance or the mean) over the
#' autocorrelation \eqn{R(l)} for different lags. The autocorrelation \eqn{R(l)} for lag \eqn{l} is defined as
#' 
#' \deqn{R(l) = \frac{1}{(n-l)\sigma^{2}} \sum_{t=1}^{n-l}(X_{t}-\mu )(X_{t+l}-\mu)}
#' 
#' where \eqn{X_i} are the values of the time series, \eqn{n} its length. Finally, \eqn{\sigma^2} and
#' \eqn{\mu} are estimators for its variance and mean
#' (See `Estimation of the Autocorrelation function <http://en.wikipedia.org/wiki/Autocorrelation#Estimation>`_).
#' 
#' The \eqn{R(l)} for different lags \eqn{l} form a vector. This feature calculator applies the aggregation
#' function \eqn{f_{agg}} to this vector and returns
#' 
#' \deqn{f_{agg} \left( R(1), \ldots, R(m)\right) \quad \text{for} \quad m = max(n, maxlag).}
#' 
#' Here \eqn{maxlag} is the second parameter passed to this function.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"f_agg": x, "maxlag", n} with x str, the name of a numpy function
#' (e.g. "mean", "var", "std", "median"), its the name of the aggregator function that is applied to the
#' autocorrelations. Further, n is an int and the maximal number of lags to consider.
#' (type:  list)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
agg_autocorrelation <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$agg_autocorrelation(x, param)
  `names<-`(out, 'agg_autocorrelation')
}

#' Agg linear trend
#' 
#' 
#' Calculates a linear least-squares regression for values of the time series that were aggregated over chunks versus
#' the sequence from 0 up to the number of chunks minus one.
#' 
#' This feature assumes the signal to be uniformly sampled. It will not use the time stamps to fit the model.
#' 
#' The parameters attr controls which of the characteristics are returned. Possible extracted attributes are "pvalue",
#' "rvalue", "intercept", "slope", "stderr", see the documentation of linregress for more information.
#' 
#' The chunksize is regulated by "chunk_len". It specifies how many time series values are in each chunk.
#' 
#' Further, the aggregation function is controlled by "f_agg", which can use "max", "min" or , "mean", "median"
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"attr": x, "chunk_len": l, "f_agg": f} with x, f an string and l an int
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
agg_linear_trend <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$agg_linear_trend(x, param)
  `names<-`(out, 'agg_linear_trend')
}

#' Approximate entropy
#' 
#' 
#' Implements a vectorized Approximate entropy algorithm.
#' 
#' https://en.wikipedia.org/wiki/Approximate_entropy
#' 
#' For short time-series this method is highly dependent on the parameters,
#' but should be stable for N > 2000, see:
#' 
#' Yentes et al. (2012) -
#' *The Appropriate Use of Approximate Entropy and Sample Entropy with Short Data Sets*
#' 
#' 
#' Other shortcomings and alternatives discussed in:
#' 
#' Richman & Moorman (2000) -
#' *Physiological time-series analysis using approximate entropy and sample entropy*
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param m Length of compared run of data
#' (type:  int)
#' @param r Filtering level, must be positive
#' (type:  float)
#' 
#' @return Approximate entropy
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
approximate_entropy <- function(x, m, r){
  out <- tsfresh$feature_extraction$feature_calculators$approximate_entropy(x, m, r)
  `names<-`(out, 'approximate_entropy')
}

#' Ar coefficient
#' 
#' 
#' This feature calculator fits the unconditional maximum likelihood
#' of an autoregressive AR(k) process.
#' The k parameter is the maximum lag of the process
#' 
#' \deqn{X_{t}=\varphi_0 +\sum _{{i=1}}^{k}\varphi_{i}X_{{t-i}}+\varepsilon_{t}}
#' 
#' For the configurations from param which should contain the maxlag "k" and such an AR process is calculated. Then
#' the coefficients \eqn{\varphi_{i}} whose index \eqn{i} contained from "coeff" are returned.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"coeff": x, "k": y} with x,y int
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
ar_coefficient <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$ar_coefficient(x, param)
  `names<-`(out, 'ar_coefficient')
}

#' Augmented dickey fuller
#' 
#' 
#' The Augmented Dickey-Fuller test is a hypothesis test which checks whether a unit root is present in a time
#' series sample. This feature calculator returns the value of the respective test statistic.
#' 
#' See the statsmodels implementation for references and more details.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"attr": x} with x str, either "teststat", "pvalue" or "usedlag"
#' (type:  list)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
augmented_dickey_fuller <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$augmented_dickey_fuller(x, param)
  `names<-`(out, 'augmented_dickey_fuller')
}

#' Autocorrelation
#' 
#' 
#' Calculates the autocorrelation of the specified lag, according to the formula \[1\]
#' 
#' \deqn{\frac{1}{(n-l)\sigma^{2}} \sum_{t=1}^{n-l}(X_{t}-\mu )(X_{t+l}-\mu)}
#' 
#' where \eqn{n} is the length of the time series \eqn{X_i}, \eqn{\sigma^2} its variance and \eqn{\mu} its
#' mean. `l` denotes the lag.
#' 
#' @references
#' 
#' \[1\] https://en.wikipedia.org/wiki/Autocorrelation#Estimation
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param lag the lag
#' (type:  int)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
autocorrelation <- function(x, lag){
  out <- tsfresh$feature_extraction$feature_calculators$autocorrelation(x, lag)
  `names<-`(out, 'autocorrelation')
}

#' Binned entropy
#' 
#' 
#' First bins the values of x into max_bins equidistant bins.
#' Then calculates the value of
#' 
#' \deqn{- \sum_{k=0}^{min(max\_bins, len(x))} p_k log(p_k) \cdot \mathbf{1}_{(p_k > 0)}}
#' 
#' where \eqn{p_k} is the percentage of samples in bin \eqn{k}.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param max_bins the maximal number of bins
#' (type:  int)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
binned_entropy <- function(x, max_bins){
  out <- tsfresh$feature_extraction$feature_calculators$binned_entropy(x, max_bins)
  `names<-`(out, 'binned_entropy')
}

#' C3
#' 
#' 
#' This function calculates the value of
#' 
#' \deqn{\frac{1}{n-2lag} \sum_{i=0}^{n-2lag} x_{i + 2 \cdot lag}^2 \cdot x_{i + lag} \cdot x_{i}}
#' 
#' which is
#' 
#' \deqn{\mathbb{E}\[L^2(X)^2 \cdot L(X) \cdot X\]}
#' 
#' where \eqn{\mathbb{E}} is the mean and \eqn{L} is the lag operator. It was proposed in \[1\] as a measure of
#' non linearity in the time series.
#' 
#' @references
#' 
#' |  \[1\] Schreiber, T. and Schmitz, A. (1997).
#' |  Discrimination power of measures for nonlinearity in a time series
#' |  PHYSICAL REVIEW E, VOLUME 55, NUMBER 5
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param lag the lag that should be used in the calculation of the feature
#' (type:  int)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
c3 <- function(x, lag){
  out <- tsfresh$feature_extraction$feature_calculators$c3(x, lag)
  `names<-`(out, 'c3')
}

#' Change quantiles
#' 
#' 
#' First fixes a corridor given by the quantiles ql and qh of the distribution of x.
#' Then calculates the average, absolute value of consecutive changes of the series x inside this corridor.
#' 
#' Think about selecting a corridor on the
#' y-Axis and only calculating the mean of the absolute change of the time series inside this corridor.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param ql the lower quantile of the corridor
#' (type:  float)
#' @param qh the higher quantile of the corridor
#' (type:  float)
#' @param isabs should the absolute differences be taken?
#' (type:  bool)
#' @param f_agg the aggregator function that is applied to the differences in the bin
#' (type:  str, name of a numpy function (e.g. mean, var, std, median))
#' 
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
change_quantiles <- function(x, ql, qh, isabs, f_agg){
  out <- tsfresh$feature_extraction$feature_calculators$change_quantiles(x, ql, qh, isabs, f_agg)
  `names<-`(out, 'change_quantiles')
}

#' Cid ce
#' 
#' 
#' This function calculator is an estimate for a time series complexity \[1\] (A more complex time series has more peaks,
#' valleys etc.). It calculates the value of
#' 
#' \deqn{\sqrt{ \sum_{i=0}^{n-2lag} ( x_{i} - x_{i+1})^2 }}
#' 
#' @references
#' 
#' |  \[1\] Batista, Gustavo EAPA, et al (2014).
#' |  CID: an efficient complexity-invariant distance for time series.
#' |  Data Mining and Knowledge Difscovery 28.3 (2014): 634-669.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param normalize should the time series be z-transformed?
#' (type:  bool)
#' 
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
cid_ce <- function(x, normalize){
  out <- tsfresh$feature_extraction$feature_calculators$cid_ce(x, normalize)
  `names<-`(out, 'cid_ce')
}

#' Count above mean
#' 
#' 
#' Returns the number of values in x that are higher than the mean of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
count_above_mean <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$count_above_mean(x)
  `names<-`(out, 'count_above_mean')
}

#' Count below mean
#' 
#' 
#' Returns the number of values in x that are lower than the mean of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
count_below_mean <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$count_below_mean(x)
  `names<-`(out, 'count_below_mean')
}

#' Cwt coefficients
#' 
#' 
#' Calculates a Continuous wavelet transform for the Ricker wavelet, also known as the "Mexican hat wavelet" which is
#' defined by
#' 
#' \deqn{\frac{2}{\sqrt{3a} \pi^{\frac{1}{4}}} (1 - \frac{x^2}{a^2}) exp(-\frac{x^2}{2a^2})}
#' 
#' where \eqn{a} is the width parameter of the wavelet function.
#' 
#' This feature calculator takes three different parameter: widths, coeff and w. The feature calculater takes all the
#' different widths arrays and then calculates the cwt one time for each different width array. Then the values for the
#' different coefficient for coeff and width w are returned. (For each dic in param one feature is returned)
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"widths":x, "coeff": y, "w": z} with x array of int and y,z int
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
cwt_coefficients <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$cwt_coefficients(x, param)
  `names<-`(out, 'cwt_coefficients')
}

#' Energy ratio by chunks
#' 
#' 
#' Calculates the sum of squares of chunk i out of N chunks expressed as a ratio with the sum of squares over the whole
#' series.
#' 
#' Takes as input parameters the number num_segments of segments to divide the series into and segment_focus
#' which is the segment number (starting at zero) to return a feature on.
#' 
#' If the length of the time series is not a multiple of the number of segments, the remaining data points are
#' distributed on the bins starting from the first. For example, if your time series consists of 8 entries, the
#' first two bins will contain 3 and the last two values, e.g. `\[ 0.,  1.,  2.\], \[ 3.,  4.,  5.\]` and `\[ 6.,  7.\]`.
#' 
#' Note that the answer for `num_segments = 1` is a trivial "1" but we handle this scenario
#' in case somebody calls it. Sum of the ratios should be 1.0.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"num_segments": N, "segment_focus": i} with N, i both ints
#' @return the feature values
#' (type:  list of tuples (index, data))
#' 
#' 
#' 
#' 
#' @export
energy_ratio_by_chunks <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$energy_ratio_by_chunks(x, param)
  `names<-`(out, 'energy_ratio_by_chunks')
}

#' Fft aggregated
#' 
#' 
#' Returns the spectral centroid (mean), variance, skew, and kurtosis of the absolute fourier transform spectrum.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"aggtype": s} where s str and in \["centroid", "variance",
#' "skew", "kurtosis"\]
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
fft_aggregated <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$fft_aggregated(x, param)
  `names<-`(out, 'fft_aggregated')
}

#' Fft coefficient
#' 
#' 
#' Calculates the fourier coefficients of the one-dimensional discrete Fourier Transform for real input by fast
#' fourier transformation algorithm
#' 
#' \deqn{A_k =  \sum_{m=0}^{n-1} a_m \exp \left \{ -2 \pi i \frac{m k}{n} \right \}, \qquad k = 0,        \ldots , n-1.}
#' 
#' The resulting coefficients will be complex, this feature calculator can return the real part (attr=="real"),
#' the imaginary part (attr=="imag), the absolute value (attr=""abs) and the angle in degrees (attr=="angle).
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"coeff": x, "attr": s} with x int and x >= 0, s str and in \["real", "imag",
#' "abs", "angle"\]
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
fft_coefficient <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$fft_coefficient(x, param)
  `names<-`(out, 'fft_coefficient')
}

#' First location of maximum
#' 
#' 
#' Returns the first location of the maximum value of x.
#' The position is calculated relatively to the length of x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
first_location_of_maximum <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$first_location_of_maximum(x)
  `names<-`(out, 'first_location_of_maximum')
}

#' First location of minimum
#' 
#' 
#' Returns the first location of the minimal value of x.
#' The position is calculated relatively to the length of x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
first_location_of_minimum <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$first_location_of_minimum(x)
  `names<-`(out, 'first_location_of_minimum')
}

#' Friedrich coefficients
#' 
#' 
#' Coefficients of polynomial \eqn{h(x)}, which has been fitted to
#' the deterministic dynamics of Langevin model
#' 
#' \deqn{\dot{x}(t) = h(x(t)) + \mathcal{N}(0,R)}
#' 
#' as described by \[1\].
#' 
#' For short time-series this method is highly dependent on the parameters.
#' 
#' @references
#' 
#' |  \[1\] Friedrich et al. (2000): Physics Letters A 271, p. 217-222
#' |  *Extracting model equations from experimental data*
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param c the time series name
#' (type:  str)
#' @param param contains dictionaries {"coeff": x} with x int and x >= 0
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
friedrich_coefficients <- function(x, c, param){
  out <- tsfresh$feature_extraction$feature_calculators$friedrich_coefficients(x, c, param)
  `names<-`(out, 'friedrich_coefficients')
}

#' Has duplicate
#' 
#' 
#' Checks if any value in x occurs more than once
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  bool)
#' 
#' 
#' 
#' 
#' @export
has_duplicate <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$has_duplicate(x)
  `names<-`(out, 'has_duplicate')
}

#' Has duplicate max
#' 
#' 
#' Checks if the maximum value of x is observed more than once
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  bool)
#' 
#' 
#' 
#' 
#' @export
has_duplicate_max <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$has_duplicate_max(x)
  `names<-`(out, 'has_duplicate_max')
}

#' Has duplicate min
#' 
#' 
#' Checks if the minimal value of x is observed more than once
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  bool)
#' 
#' 
#' 
#' 
#' @export
has_duplicate_min <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$has_duplicate_min(x)
  `names<-`(out, 'has_duplicate_min')
}

#' Index mass quantile
#' 
#' 
#' Those apply features calculate the relative index i where q% of the mass of the time series x lie left of i.
#' For example for q = 50% this feature calculator will return the mass center of the time series
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"q": x} with x float
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
index_mass_quantile <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$index_mass_quantile(x, param)
  `names<-`(out, 'index_mass_quantile')
}

#' Kurtosis
#' 
#' 
#' Returns the kurtosis of x (calculated with the adjusted Fisher-Pearson standardized
#' moment coefficient G2).
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
kurtosis <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$kurtosis(x)
  `names<-`(out, 'kurtosis')
}

#' Large standard deviation
#' 
#' 
#' Boolean variable denoting if the standard dev of x is higher
#' than 'r' times the range = difference between max and min of x.
#' Hence it checks if
#' 
#' \deqn{std(x) > r * (max(X)-min(X))}
#' 
#' According to a rule of the thumb, the standard deviation should be a forth of the range of the values.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param r the percentage of the range to compare with
#' (type:  float)
#' @return the value of this feature
#' (type:  bool)
#' 
#' 
#' 
#' 
#' @export
large_standard_deviation <- function(x, r){
  out <- tsfresh$feature_extraction$feature_calculators$large_standard_deviation(x, r)
  `names<-`(out, 'large_standard_deviation')
}

#' Last location of maximum
#' 
#' 
#' Returns the relative last location of the maximum value of x.
#' The position is calculated relatively to the length of x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
last_location_of_maximum <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$last_location_of_maximum(x)
  `names<-`(out, 'last_location_of_maximum')
}

#' Last location of minimum
#' 
#' 
#' Returns the last location of the minimal value of x.
#' The position is calculated relatively to the length of x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
last_location_of_minimum <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$last_location_of_minimum(x)
  `names<-`(out, 'last_location_of_minimum')
}

#' Length
#' 
#' 
#' Returns the length of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  int)
#' 
#' 
#' 
#' 
#' @export
length <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$length(x)
  `names<-`(out, 'length')
}

#' Linear trend
#' 
#' 
#' Calculate a linear least-squares regression for the values of the time series versus the sequence from 0 to
#' length of the time series minus one.
#' This feature assumes the signal to be uniformly sampled. It will not use the time stamps to fit the model.
#' The parameters control which of the characteristics are returned.
#' 
#' Possible extracted attributes are "pvalue", "rvalue", "intercept", "slope", "stderr", see the documentation of
#' linregress for more information.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"attr": x} with x an string, the attribute name of the regression model
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
linear_trend <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$linear_trend(x, param)
  `names<-`(out, 'linear_trend')
}

#' Longest strike above mean
#' 
#' 
#' Returns the length of the longest consecutive subsequence in x that is bigger than the mean of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
longest_strike_above_mean <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$longest_strike_above_mean(x)
  `names<-`(out, 'longest_strike_above_mean')
}

#' Longest strike below mean
#' 
#' 
#' Returns the length of the longest consecutive subsequence in x that is smaller than the mean of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
longest_strike_below_mean <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$longest_strike_below_mean(x)
  `names<-`(out, 'longest_strike_below_mean')
}

#' Max langevin fixed point
#' 
#' 
#' Largest fixed point of dynamics  :math:argmax_x {h(x)=0}` estimated from polynomial \eqn{h(x)},
#' which has been fitted to the deterministic dynamics of Langevin model
#' 
#' \deqn{\dot(x)(t) = h(x(t)) + R \mathcal(N)(0,1)}
#' 
#' as described by
#' 
#' Friedrich et al. (2000): Physics Letters A 271, p. 217-222
#' *Extracting model equations from experimental data*
#' 
#' For short time-series this method is highly dependent on the parameters.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param m order of polynom to fit for estimating fixed points of dynamics
#' (type:  int)
#' @param r number of quantils to use for averaging
#' (type:  float)
#' 
#' @return Largest fixed point of deterministic dynamics
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
max_langevin_fixed_point <- function(x, m, r){
  out <- tsfresh$feature_extraction$feature_calculators$max_langevin_fixed_point(x, m, r)
  `names<-`(out, 'max_langevin_fixed_point')
}

#' Maximum
#' 
#' 
#' Calculates the highest value of the time series x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
maximum <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$maximum(x)
  `names<-`(out, 'maximum')
}

#' Mean
#' 
#' 
#' Returns the mean of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
mean <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$mean(x)
  `names<-`(out, 'mean')
}

#' Mean abs change
#' 
#' 
#' Returns the mean over the absolute differences between subsequent time series values which is
#' 
#' \deqn{\frac{1}{n} \sum_{i=1,\ldots, n-1} | x_{i+1} - x_{i}|}
#' 
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
mean_abs_change <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$mean_abs_change(x)
  `names<-`(out, 'mean_abs_change')
}

#' Mean change
#' 
#' 
#' Returns the mean over the differences between subsequent time series values which is
#' 
#' \deqn{\frac{1}{n} \sum_{i=1,\ldots, n-1}  x_{i+1} - x_{i}}
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
mean_change <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$mean_change(x)
  `names<-`(out, 'mean_change')
}

#' Mean second derivative central
#' 
#' 
#' Returns the mean value of a central approximation of the second derivative
#' 
#' \deqn{\frac{1}{n} \sum_{i=1,\ldots, n-1}  \frac{1}{2} (x_{i+2} - 2 \cdot x_{i+1} + x_i)}
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
mean_second_derivative_central <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$mean_second_derivative_central(x)
  `names<-`(out, 'mean_second_derivative_central')
}

#' Median
#' 
#' 
#' Returns the median of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
median <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$median(x)
  `names<-`(out, 'median')
}

#' Minimum
#' 
#' 
#' Calculates the lowest value of the time series x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
minimum <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$minimum(x)
  `names<-`(out, 'minimum')
}

#' Number crossing m
#' 
#' 
#' Calculates the number of crossings of x on m. A crossing is defined as two sequential values where the first value
#' is lower than m and the next is greater, or vice-versa. If you set m to zero, you will get the number of zero
#' crossings.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param m the threshold for the crossing
#' (type:  float)
#' @return the value of this feature
#' (type:  int)
#' 
#' 
#' 
#' 
#' @export
number_crossing_m <- function(x, m){
  out <- tsfresh$feature_extraction$feature_calculators$number_crossing_m(x, m)
  `names<-`(out, 'number_crossing_m')
}

#' Number cwt peaks
#' 
#' 
#' This feature calculator searches for different peaks in x. To do so, x is smoothed by a ricker wavelet and for
#' widths ranging from 1 to n. This feature calculator returns the number of peaks that occur at enough width scales
#' and with sufficiently high Signal-to-Noise-Ratio (SNR)
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param n maximum width to consider
#' (type:  int)
#' @return the value of this feature
#' (type:  int)
#' 
#' 
#' 
#' 
#' @export
number_cwt_peaks <- function(x, n){
  out <- tsfresh$feature_extraction$feature_calculators$number_cwt_peaks(x, n)
  `names<-`(out, 'number_cwt_peaks')
}

#' Number peaks
#' 
#' 
#' Calculates the number of peaks of at least support n in the time series x. A peak of support n is defined as a
#' subsequence of x where a value occurs, which is bigger than its n neighbours to the left and to the right.
#' 
#' Hence in the sequence
#' 
#' >>> x = \[3, 0, 0, 4, 0, 0, 13\]
#' 
#' 4 is a peak of support 1 and 2 because in the subsequences
#' 
#' >>> \[0, 4, 0\]
#' >>> \[0, 0, 4, 0, 0\]
#' 
#' 4 is still the highest value. Here, 4 is not a peak of support 3 because 13 is the 3th neighbour to the right of 4
#' and its bigger than 4.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param n the support of the peak
#' (type:  int)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
number_peaks <- function(x, n){
  out <- tsfresh$feature_extraction$feature_calculators$number_peaks(x, n)
  `names<-`(out, 'number_peaks')
}

#' Partial autocorrelation
#' 
#' 
#' Calculates the value of the partial autocorrelation function at the given lag. The lag `k` partial autocorrelation
#' of a time series \eqn{\lbrace x_t, t = 1 \ldots T \rbrace} equals the partial correlation of \eqn{x_t} and
#' \eqn{x_{t-k}}, adjusted for the intermediate variables
#' \eqn{\lbrace x_{t-1}, \ldots, x_{t-k+1} \rbrace} (\[1\]).
#' Following \[2\], it can be defined as
#' 
#' \deqn{\alpha_k = \frac{ Cov(x_t, x_{t-k} | x_{t-1}, \ldots, x_{t-k+1})}        {\sqrt{ Var(x_t | x_{t-1}, \ldots, x_{t-k+1}) Var(x_{t-k} | x_{t-1}, \ldots, x_{t-k+1} )}}}
#' 
#' with (a) \eqn{x_t = f(x_{t-1}, \ldots, x_{t-k+1})} and (b) \eqn{x_{t-k} = f(x_{t-1}, \ldots, x_{t-k+1})}
#' being AR(k-1) models that can be fitted by OLS. Be aware that in (a), the regression is done on past values to
#' predict \eqn{x_t} whereas in (b), future values are used to calculate the past value \eqn{x_{t-k}}.
#' It is said in \[1\] that "for an AR(p), the partial autocorrelations \[ \eqn{\alpha_k} \] will be nonzero for `k<=p`
#' and zero for `k>p`."
#' With this property, it is used to determine the lag of an AR-Process.
#' 
#' @references
#' 
#' |  \[1\] Box, G. E., Jenkins, G. M., Reinsel, G. C., & Ljung, G. M. (2015).
#' |  Time series analysis: forecasting and control. John Wiley & Sons.
#' |  \[2\] https://onlinecourses.science.psu.edu/stat510/node/62
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"lag": val} with int val indicating the lag to be returned
#' (type:  list)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
partial_autocorrelation <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$partial_autocorrelation(x, param)
  `names<-`(out, 'partial_autocorrelation')
}

#' Percentage of reoccurring datapoints to all datapoints
#' 
#' 
#' Returns the percentage of unique values, that are present in the time series
#' more than once.
#' 
#' len(different values occurring more than once) / len(different values)
#' 
#' This means the percentage is normalized to the number of unique values,
#' in contrast to the percentage_of_reoccurring_values_to_all_values.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
percentage_of_reoccurring_datapoints_to_all_datapoints <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$percentage_of_reoccurring_datapoints_to_all_datapoints(x)
  `names<-`(out, 'percentage_of_reoccurring_datapoints_to_all_datapoints')
}

#' Percentage of reoccurring values to all values
#' 
#' 
#' Returns the ratio of unique values, that are present in the time series
#' more than once.
#' 
#' # of data points occurring more than once / # of all data points
#' 
#' This means the ratio is normalized to the number of data points in the time series,
#' in contrast to the percentage_of_reoccurring_datapoints_to_all_datapoints.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
percentage_of_reoccurring_values_to_all_values <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$percentage_of_reoccurring_values_to_all_values(x)
  `names<-`(out, 'percentage_of_reoccurring_values_to_all_values')
}

#' Quantile
#' 
#' 
#' Calculates the q quantile of x. This is the value of x greater than q% of the ordered values from x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param q the quantile to calculate
#' (type:  float)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
quantile <- function(x, q){
  out <- tsfresh$feature_extraction$feature_calculators$quantile(x, q)
  `names<-`(out, 'quantile')
}

#' Range count
#' 
#' 
#' Count observed values within the interval \[min, max).
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param min the inclusive lower bound of the range
#' (type:  int or float)
#' @param max the exclusive upper bound of the range
#' (type:  int or float)
#' @return the count of values within the range
#' (type:  int)
#' 
#' 
#' 
#' 
#' @export
range_count <- function(x, min, max){
  out <- tsfresh$feature_extraction$feature_calculators$range_count(x, min, max)
  `names<-`(out, 'range_count')
}

#' Ratio beyond r sigma
#' 
#' 
#' Ratio of values that are more than r*std(x) (so r sigma) away from the mean of x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  iterable)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
ratio_beyond_r_sigma <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$ratio_beyond_r_sigma(x)
  `names<-`(out, 'ratio_beyond_r_sigma')
}

#' Ratio value number to time series length
#' 
#' 
#' Returns a factor which is 1 if all values in the time series occur only once,
#' and below one if this is not the case.
#' In principle, it just returns
#' 
#' # unique values / # values
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
ratio_value_number_to_time_series_length <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$ratio_value_number_to_time_series_length(x)
  `names<-`(out, 'ratio_value_number_to_time_series_length')
}

#' Sample entropy
#' 
#' 
#' Calculate and return sample entropy of x.
#' 
#' @references
#' 
#' |  \[1\] http://en.wikipedia.org/wiki/Sample_Entropy
#' |  \[2\] https://www.ncbi.nlm.nih.gov/pubmed/10843903?dopt=Abstract
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' 
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
sample_entropy <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$sample_entropy(x)
  `names<-`(out, 'sample_entropy')
}

#' Set property
#' 
#' 
#' This method returns a decorator that sets the property key of the function to value
#' 
#' 
#' @export
set_property <- function(){
  out <- tsfresh$feature_extraction$feature_calculators$set_property()
  `names<-`(out, 'set_property')
}

#' Skewness
#' 
#' 
#' Returns the sample skewness of x (calculated with the adjusted Fisher-Pearson standardized
#' moment coefficient G1).
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
skewness <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$skewness(x)
  `names<-`(out, 'skewness')
}

#' Spkt welch density
#' 
#' 
#' This feature calculator estimates the cross power spectral density of the time series x at different frequencies.
#' To do so, the time series is first shifted from the time domain to the frequency domain.
#' 
#' The feature calculators returns the power spectrum of the different frequencies.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param param contains dictionaries {"coeff": x} with x int
#' (type:  list)
#' @return the different feature values
#' (type:  numeric vector)
#' 
#' 
#' 
#' 
#' @export
spkt_welch_density <- function(x, param){
  out <- tsfresh$feature_extraction$feature_calculators$spkt_welch_density(x, param)
  `names<-`(out, 'spkt_welch_density')
}

#' Standard deviation
#' 
#' 
#' Returns the standard deviation of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
standard_deviation <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$standard_deviation(x)
  `names<-`(out, 'standard_deviation')
}

#' Sum of reoccurring data points
#' 
#' 
#' Returns the sum of all data points, that are present in the time series
#' more than once.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
sum_of_reoccurring_data_points <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$sum_of_reoccurring_data_points(x)
  `names<-`(out, 'sum_of_reoccurring_data_points')
}

#' Sum of reoccurring values
#' 
#' 
#' Returns the sum of all values, that are present in the time series
#' more than once.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
sum_of_reoccurring_values <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$sum_of_reoccurring_values(x)
  `names<-`(out, 'sum_of_reoccurring_values')
}

#' Sum values
#' 
#' 
#' Calculates the sum over the time series values
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  bool)
#' 
#' 
#' 
#' 
#' @export
sum_values <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$sum_values(x)
  `names<-`(out, 'sum_values')
}

#' Symmetry looking
#' 
#' 
#' Boolean variable denoting if the distribution of x *looks symmetric*. This is the case if
#' 
#' \deqn{| mean(X)-median(X)| < r * (max(X)-min(X))}
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param r the percentage of the range to compare with
#' (type:  float)
#' @return the value of this feature
#' (type:  bool)
#' 
#' 
#' 
#' 
#' @export
symmetry_looking <- function(x, r){
  out <- tsfresh$feature_extraction$feature_calculators$symmetry_looking(x, r)
  `names<-`(out, 'symmetry_looking')
}

#' Time reversal asymmetry statistic
#' 
#' 
#' This function calculates the value of
#' 
#' \deqn{\frac{1}{n-2lag} \sum_{i=0}^{n-2lag} x_{i + 2 \cdot lag}^2 \cdot x_{i + lag} - x_{i + lag} \cdot  x_{i}^2}
#' 
#' which is
#' 
#' \deqn{\mathbb{E}\[L^2(X)^2 \cdot L(X) - L(X) \cdot X^2\]}
#' 
#' where \eqn{\mathbb{E}} is the mean and \eqn{L} is the lag operator. It was proposed in \[1\] as a
#' promising feature to extract from time series.
#' 
#' @references
#' 
#' |  \[1\] Fulcher, B.D., Jones, N.S. (2014).
#' |  Highly comparative feature-based time-series classification.
#' |  Knowledge and Data Engineering, IEEE Transactions on 26, 3026–3037.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param lag the lag that should be used in the calculation of the feature
#' (type:  int)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
time_reversal_asymmetry_statistic <- function(x, lag){
  out <- tsfresh$feature_extraction$feature_calculators$time_reversal_asymmetry_statistic(x, lag)
  `names<-`(out, 'time_reversal_asymmetry_statistic')
}

#' Value count
#' 
#' 
#' Count occurrences of `value` in time series x.
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @param value the value to be counted
#' (type:  int or float)
#' @return the count
#' (type:  int)
#' 
#' 
#' 
#' 
#' @export
value_count <- function(x, value){
  out <- tsfresh$feature_extraction$feature_calculators$value_count(x, value)
  `names<-`(out, 'value_count')
}

#' Variance
#' 
#' 
#' Returns the variance of x
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  float)
#' 
#' 
#' 
#' 
#' @export
variance <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$variance(x)
  `names<-`(out, 'variance')
}

#' Variance larger than standard deviation
#' 
#' 
#' Boolean variable denoting if the variance of x is greater than its standard deviation. Is equal to variance of x
#' being larger than 1
#' 
#' @param x the time series to calculate the feature of
#' (type:  numeric vector)
#' @return the value of this feature
#' (type:  bool)
#' 
#' 
#' 
#' 
#' @export
variance_larger_than_standard_deviation <- function(x){
  out <- tsfresh$feature_extraction$feature_calculators$variance_larger_than_standard_deviation(x)
  `names<-`(out, 'variance_larger_than_standard_deviation')
}
