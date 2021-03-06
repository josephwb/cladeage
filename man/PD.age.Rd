% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PD.age.R
\name{PD.age}
\alias{PD.age}
\alias{PD.age.unc}
\alias{PD.age.plot}
\title{Probability densities of clade age estimates derived from descendant
fossil occurrences}
\usage{
PD.age(x, baseline = NULL, p.max = 0.99)

PD.age.unc(x, baseline = NULL, p.max = 0.99, reps = 1000, breaks = 100)

PD.age.plot(
  x,
  baseline = NULL,
  p.max = 0.99,
  reps = 1000,
  breaks = 100,
  line.col = "red",
  ...
)
}
\arguments{
\item{x}{A vector of fossil ages (\code{PD.age}) or a matrix
(\code{PD.age.unc}) of fossil ages in which the first column is the maximum
age (or lower stratigraphic bound) and the second column is the minimum
fossil age (upper stratigraphic bound) for each fossil.}

\item{baseline}{Youngest bound of the distribution that could be the
present (=0), or some other stratum of reference. If a baseline is not
provided, the minimum value of ages is used as baseline and n-1 is used for
the sample size instead of n for calculations (Solow, 2003).}

\item{p.max}{The cumulative probability value to set a limit on the range of
values for which the probability is calculated}

\item{reps}{The number of pseudoreplicates used to account for fossil age
uncertainty}

\item{breaks}{The number of breaks or time intervals used to summarize the
pseudoreplicates}

\item{line.col}{The colour of the probability distribution curve. Only used
with \code{PD.age.plot}}

\item{...}{Further arguments passed to \code{PD.age.plot}}
}
\value{
In the case of \code{PD.age} and \code{PD.age.unc}, a dataframe with
two columns: \code{age} (the geological age under consideration), and
\code{p} (the associated probability for the clade origin).
}
\description{
\code{PD.age} assumes that fossil ages are known without error.
In contrast, \code{PD.age.unc} incorporates fossil age uncertainty; in the
latter, the minimum and maximum ages are treated as bounds on a uniform
distribution. \code{PD.age.plot} plots the distribution of interest.
}
\examples{
\dontrun{
  # No fossil age uncertainty
  PD.age(c(54,31, 25, 14, 5));
  PD.age(c(54,31, 25, 14, 5), baseline=0);
  
  # With fossil age uncertainty
  PD.age.unc(cbind(c(56, 35, 25, 14, 6), c(50, 30, 25, 14, 3.5)), baseline=0);
  
  # Plot and fit of probability density function
  PD.age.plot(c(54,31, 25, 14, 5), p.max=0.99);
  curve(dexp(x-54, rate=0.062), col='black', lwd=3, add=TRUE);
  
  # Same, but use lognormal distribution
  PD.age.plot(cbind(c(56, 35, 25, 14, 6), c(50, 30, 25, 14, 3.5)));
  curve(dlnorm(x-50, meanlog=2.7, sdlog=1)*1.3, col='black', lwd=3, add=TRUE);
  }
}
\references{
\insertRef{Claramunt2015}{cladeage}

\insertRef{Solow2003}{cladeage}

\insertRef{Wang2007}{cladeage}

\insertRef{Wang2010}{cladeage}
}
