% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/forest_summary.R
\name{test_calibration}
\alias{test_calibration}
\title{Omnibus evaluation of the quality of the random forest estimates via calibration.}
\usage{
test_calibration(forest)
}
\arguments{
\item{forest}{The trained forest.}
}
\value{
A heteroskedasticity-consistent test of calibration.
}
\description{
Test calibration of the forest. Computes the best linear fit of the target
estimand using the forest prediction (on held-out data) as well as the mean
forest prediction as the sole two regressors. A coefficient of 1 for
`mean.forest.prediction` suggests that the mean forest prediction is correct,
whereas a coefficient of 1 for `differential.forest.prediction` additionally suggests
that the forest has captured heterogeneity in the underlying signal.
The p-value of the `differential.forest.prediction` coefficient
also acts as an omnibus test for the presence of heterogeneity: If the coefficient
is significantly greater than 0, then we can reject the null of
no heterogeneity.
}
\examples{
\dontrun{
n <- 800
p <- 5
X <- matrix(rnorm(n * p), n, p)
W <- rbinom(n, 1, 0.25 + 0.5 * (X[, 1] > 0))
Y <- pmax(X[, 1], 0) * W + X[, 2] + pmin(X[, 3], 0) + rnorm(n)
forest <- causal_forest(X, Y, W)
test_calibration(forest)
}

}
\references{
Chernozhukov, Victor, Mert Demirer, Esther Duflo, and Ivan Fernandez-Val.
            "Generic Machine Learning Inference on Heterogenous Treatment Effects in
            Randomized Experiments." arXiv preprint arXiv:1712.04802 (2017).
}
