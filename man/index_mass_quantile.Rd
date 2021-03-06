% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/features.R
\name{index_mass_quantile}
\alias{index_mass_quantile}
\title{Index mass quantile}
\usage{
index_mass_quantile(x, param)
}
\arguments{
\item{x}{the time series to calculate the feature of
(type:  numeric vector)}

\item{param}{contains dictionaries {"q": x} with x float
(type:  list)}
}
\value{
the different feature values
(type:  numeric vector)
}
\description{
Those apply features calculate the relative index i where q% of the mass of the time series x lie left of i.
For example for q = 50% this feature calculator will return the mass center of the time series
}
