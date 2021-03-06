% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/merge_forests.R
\name{merge_forests}
\alias{merge_forests}
\title{Merges a list of forests that were grown using the same data into one large forest.}
\usage{
merge_forests(forest_list, compute.oob.predictions = TRUE)
}
\arguments{
\item{forest_list}{A `list` of forests to be concatenated.
All forests must be of the same type, and the type must be a subclass of `grf`.
In addition, all forests must have the same 'ci.group.size'.
Other tuning parameters (e.g. alpha, mtry, min.node.size, imbalance.penalty) are
allowed to differ across forests.}

\item{compute.oob.predictions}{Whether OOB predictions on training set should be precomputed.
Note that even if OOB predictions have already been precomputed for the forests in 'forest_list',
those predictions are not used. Instead, a new set of oob predictions is computed anew using the
larger forest. Default is TRUE.}
}
\value{
A single forest containing all the trees in each forest in the input list.
}
\description{
Merges a list of forests that were grown using the same data into one large forest.
}
\examples{
\dontrun{
# Train standard regression forests
n <- 50
p <- 10
X <- matrix(rnorm(n * p), n, p)
Y <- X[, 1] * rnorm(n)
r.forest1 <- regression_forest(X, Y, compute.oob.predictions = FALSE, num.trees = 100)
r.forest2 <- regression_forest(X, Y, compute.oob.predictions = FALSE, num.trees = 100)

# Join the forests together. The resulting forest will contain 200 trees.
big_rf <- merge_forests(list(r.forest1, r.forest2))
}

}
