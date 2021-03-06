% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/features.R
\name{ar_coefficient}
\alias{ar_coefficient}
\title{Ar coefficient}
\usage{
ar_coefficient(x, param)
}
\arguments{
\item{x}{the time series to calculate the feature of
(type:  numeric vector)}

\item{param}{contains dictionaries {"coeff": x, "k": y} with x,y int
(type:  list)}
}
\value{
the different feature values
(type:  numeric vector)
}
\description{
This feature calculator fits the unconditional maximum likelihood
of an autoregressive AR(k) process.
The k parameter is the maximum lag of the process
}
\details{
\deqn{X_{t}=\varphi_0 +\sum _{{i=1}}^{k}\varphi_{i}X_{{t-i}}+\varepsilon_{t}}

For the configurations from param which should contain the maxlag "k" and such an AR process is calculated. Then
the coefficients \eqn{\varphi_{i}} whose index \eqn{i} contained from "coeff" are returned.
}
