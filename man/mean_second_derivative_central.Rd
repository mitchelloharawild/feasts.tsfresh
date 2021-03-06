% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/features.R
\name{mean_second_derivative_central}
\alias{mean_second_derivative_central}
\title{Mean second derivative central}
\usage{
mean_second_derivative_central(x)
}
\arguments{
\item{x}{the time series to calculate the feature of
(type:  numeric vector)}
}
\value{
the value of this feature
(type:  float)
}
\description{
Returns the mean value of a central approximation of the second derivative
}
\details{
\deqn{\frac{1}{n} \sum_{i=1,\ldots, n-1}  \frac{1}{2} (x_{i+2} - 2 \cdot x_{i+1} + x_i)}
}
