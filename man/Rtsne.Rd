% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/Rtsne.R
\name{Rtsne}
\alias{Rtsne}
\alias{Rtsne.data.frame}
\alias{Rtsne.default}
\alias{Rtsne.dist}
\title{Barnes-Hut implementation of t-Distributed Stochastic Neighbor Embedding}
\usage{
Rtsne(X, ...)

\method{Rtsne}{default}(X, dims = 2, initial_dims = 50, perplexity = 30,
  theta = 0.5, check_duplicates = TRUE, pca = TRUE, max_iter = 1000,
  verbose = FALSE, is_distance = FALSE)

\method{Rtsne}{dist}(X, ..., is_distance = TRUE)

\method{Rtsne}{data.frame}(X, ...)
}
\arguments{
\item{X}{matrix; Data matrix}

\item{dims}{integer; Output dimensionality (default: 2)}

\item{initial_dims}{integer; the number of dimensions that should be retained in the initial PCA step (default: 50)}

\item{perplexity}{numeric; Perplexity parameter}

\item{theta}{numeric; Speed/accuracy trade-off (increase for less accuracy), set to 0.0 for exact TSNE (default: 0.5)}

\item{check_duplicates}{logical; Checks whether duplicates are present. It is best to make sure there are no duplicates present and set this option to FALSE, especially for large datasets (default: TRUE)}

\item{pca}{logical; Whether an initial PCA step should be performed (default: TRUE)}

\item{max_iter}{integer; Maximum number of iterations (default: 1000)}

\item{verbose}{logical; Whether progress updates should be printed (default: FALSE)}

\item{is_distance}{logical; Indicate whether X is a distance matrix (experimental, default: FALSE)}
}
\value{
List with the following elements:
\item{Y}{Matrix containing the new representations for the objects}
\item{N}{Number of objects}
\item{origD}{Original Dimensionality before TSNE}
\item{perplexity}{See above}
\item{theta}{See above}
\item{costs}{The cost for every object after the final iteration}
\item{itercosts}{The total costs for all objects in every 50th + the last iteration}
}
\description{
Wrapper for the C++ implementation of Barnes-Hut t-Distributed Stochastic Neighbor Embedding
}
\details{
After checking the correctness of the input, this function (optionally) does an initial reduction of the feature space using \code{\link{prcomp}}, before calling the C++ TSNE implementation. Since R's random number generator is used, use \code{\link{set.seed}} before the function call to get reproducible results.

Is \code{X} is a data.frame, it is transformed into a matrix using \code{\link{model.matrix}}. If \code{X} is a \code{\link{dist}} object, it is currently first expanded into a full distance matrix.
}
\section{Methods (by class)}{
\itemize{
\item \code{default}: 

\item \code{dist}: 

\item \code{data.frame}: 
}}
\examples{
iris_unique <- unique(iris) # Remove duplicates
iris_matrix <- as.matrix(iris_unique[,1:4])
set.seed(42) # Set a seed if you want reproducible results
tsne_out <- Rtsne(iris_matrix) # Run TSNE

# Show the objects in the 2D tsne representation
plot(tsne_out$Y,col=iris_unique$Species)

# Using a dist object
tsne_out <- Rtsne(dist(iris_matrix))
plot(tsne_out$Y,col=iris_unique$Species)
}
\references{
L.J.P. van der Maaten. Barnes-Hut-SNE. In Proceedings of the International Conference on Learning Representations, 2013.
}

