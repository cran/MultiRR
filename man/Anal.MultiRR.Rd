\name{Anal.MultiRR}
\alias{Anal.MultiRR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fits a multilevel random regression to n simulated data frames. 
}
\description{
Performs multilevel random regressions to objects created with the function Sim.MultiRR.   
}
\usage{
Anal.MultiRR(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Object created with the function sim.MultiRR.  
}
}
\value{
A list of results from the multi-level random regression for n simulated
data sets.
}
\references{
Araya-Ajoy Y.G., Mathot, K. J., Dingemanse N. J. (2015) An approach to estimate short-term, long-term, and reaction norm repeatability. Methods in Ecology and Evolution.
}
\author{
Yimen Araya
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Sim.MultiRR}}
}
\examples{
#Example 1: Balanced sampling design.
#Define sample sizes.
n.ind <-c(40, 50) ##Numbers of individuals to simulate.
SeriesPerInd <- c(4, 5) ##Number of series per individual to simulate.
ObsPerLevel <- 2 ##Number of observations per level in the environmental gradient.
 
#Number of simulated data sets, use at least 10.
n.sim=3

#Define the environmetal gradient.
EnvGradient <- c(-0.5, 0.5)
 
#Define the population level parameters.
PopInt <- 0 ##Population level intercept.
PopSlope <- -0.5 ##Population level slope.
 
#Define individual level parameters
VCVInd <-matrix(c(0.3, 0.15, 0.15, 0.3),2,2) ##Creates a variance-covariance matrix.
 
#Define series level parameters
VCVSeries <-matrix(c(0.3, 0.15, 0.15, 0.3),2,2) ##Creates a variance-covariance matrix.
 
#Define the residual variance.
ResVar <- 0.4
 
#Simulate the data sets.
sim.data <- Sim.MultiRR(n.ind=n.ind, SeriesPerInd=SeriesPerInd, 
ObsPerLevel=ObsPerLevel, EnvGradient=EnvGradient, PopInt=PopInt, PopSlope=PopSlope, 
VCVInd=VCVInd, VCVSeries=VCVSeries, ResVar=ResVar, n.sim=3)
 
#Analyze the simulated data sets. This may take a while.
ressim <- Anal.MultiRR(sim.data)

#Summarize the results of the multi-level random regressions. 
Summary(ressim) 
 
#Estimate bias.
Bias(ressim)
 
#Estiamte imprecision.
Imprecision(ressim)
 
#Estimate power.
Power(ressim)

#Example 2: Unbalanced sampling design.
#Define sample sizes.
n.ind <-40 ##Numbers of individuals to simulate.
SeriesPerInd <- 4 ##Number of series per individual to simulate.
ObsPerLevel <- 2 ##Number of observations per level in the environmental gradient.

#Define the proportion of individuals that were sampled in all the series.
#All individuals were assayed at least once, 0.9 of individuals twice...

prop.ind<-c(1, 0.9, 0.8, 0.7)

#Define the total number of observations
n.obs=300

#Number of simulated data sets, use at least 10.
n.sim=3

#Define the environmetal gradient.
EnvGradient <- c(-0.5, 0.5)
 
#Define the population level parameters.
PopInt <- 0 ##Population level intercept.
PopSlope <- -0.5 ##Population level slope.

#Define the individual level parameters.
VCVInd <-matrix(c(0.3, 0.15, 0.15, 0.3),2,2) ##Creates a variance-covariance matrix.
 
#Define the series level parameters.
VCVSeries <-matrix(c(0.3, 0.15, 0.15, 0.3),2,2) ##Creates a variance-covariance matrix.
 
#Define the residual variance.
ResVar <- 0.4
 
#Simulate the data.
sim.data <- Sim.MultiRR(n.ind=n.ind, SeriesPerInd=SeriesPerInd, ObsPerLevel=ObsPerLevel,
EnvGradient=EnvGradient, PopInt=PopInt, PopSlope=PopSlope, VCVInd= VCVInd, VCVSeries=VCVSeries,
ResVar=ResVar, n.sim=n.sim, unbalanced=TRUE, prop.ind=c(1, 0.9, 0.8, 0.7), 
complete.observations=FALSE, n.obs=n.obs)
 
#Analyze simulated data sets. This may take a while.
ressim <- Anal.MultiRR(sim.data)
 
#Summarize the results of the multi-level random regressions.
Summary(ressim)
 
#Estimate bias.
Bias(ressim)
 
#Estiamte imprecision.
Imprecision(ressim)
 
#Estimate power.
Power(ressim)  
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ simulation }
\keyword{ multi-level random regression } % __ONLY ONE__ keyword per line
