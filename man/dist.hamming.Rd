\name{dist.hamming}
\alias{dist.hamming}
\alias{dist.logDet}
\alias{dist.ml}
\alias{readDist}
\alias{writeDist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Pairwise Distances from Sequences}
\description{
\code{dist.hamming} and \code{dist.logDet} compute pairwise distances 
for an object of class \code{phyDat}. \code{dist.ml} fits distances
for nucleotide and amino acid models.
}
\usage{
dist.hamming(x, ratio = TRUE, exclude="none")
dist.logDet(x)
dist.ml(x, model="JC69", exclude="none", bf=NULL, Q=NULL, k = 1L, shape = 1, ...)
readDist(file)
writeDist(dm, file="")
}
\arguments{
  \item{x}{An object of class \code{phyDat}}
  \item{ratio}{Compute uncorrected ('p') distance or character difference.}
  \item{model}{One of "JC69", "F81" or one of 17 amino acid models see details.}
  \item{exclude}{One of "none", "all", "pairwise" indicating whether to delete the sites with missing data (or ambigious states). The default is handle missing data as in pml.}
  \item{bf}{A vector of base frequencies.}
  \item{Q}{A vector containing the lower triangular part of the rate matrix.} 
  \item{k}{Number of intervals of the discrete gamma distribution.}
  \item{shape}{Shape parameter of the gamma distribution.}
  \item{\dots}{Further arguments passed to or from other methods.}
  \item{file}{A file name.}
  \item{dm}{A \code{dist} object.}
}
\value{
  an object of class \code{dist}
}
\details{
So far 17 amino acid models are supported ("WAG", "JTT", "LG", "Dayhoff", "cpREV", "mtmam", "mtArt", "MtZoa", "mtREV24", "VT","RtREV", "HIVw", "HIVb", "FLU", "Blossum62", "Dayhoff_DCMut" and "JTT_DCMut") and additional rate matrices and frequences can be supplied. 

The "F81" model uses empirical base frequencies, the "JC69" equal base frequencies. This is even the case if the data are not nucleotides. 
}
\references{ 
Lockhart, P. J., Steel, M. A., Hendy, M. D. and Penny, D. (1994)
Recovering evolutionary trees under a more realistic model of sequence
evolution. \emph{Molecular Biology and Evolution}, \bold{11}, 605--602.
}
\author{Klaus Schliep \email{klaus.schliep@gmail.com}}

\seealso{For more distance methods for nucleotide data see \code{\link[ape]{dist.dna}} and \code{\link{dist.p}} for pairwise polymorphism p-distances}
\examples{
data(Laurasiatherian)
dm1 <- dist.hamming(Laurasiatherian)
tree1 <- NJ(dm1)
dm2 <- dist.logDet(Laurasiatherian)
tree2 <- NJ(dm2)
treedist(tree1,tree2)
# JC model
dm3 <- dist.ml(Laurasiatherian)
tree3 <- NJ(dm3)
treedist(tree1,tree3)
# F81 + Gamma
dm4 <- dist.ml(Laurasiatherian, model="F81", k=4, shape=.4)
tree4 <- NJ(dm4)
treedist(tree1,tree4)
treedist(tree3,tree4)
}

\keyword{ cluster }
