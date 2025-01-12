% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pr_decirc_doys.R
\name{pr_decirc_phenorice}
\alias{pr_decirc_phenorice}
\title{convert PhenoRice "dates" to julian date (diff to 2000-01-01)}
\usage{
pr_decirc_phenorice(in_folder, out_folder, start_year, end_year)
}
\arguments{
\item{in_folder}{input folder containing the "ordered" multiband tiffs resulting from
`create_ordered_tiffs``}

\item{out_folder}{where to store the results}
}
\value{
NULL - files "sos_decirc.RData, sos_decirc.tif,
eos_decirc.RData, eos_decirc.tif
pos_decirc.RData, pos_decirc.tif
are created in output folder
}
\description{
convert sos, pos and eos to a numeric julian date expressing number of
days elapsed since 2000-01-01
}
\details{
NOTE: Very slow on the full mosaics, but works in the same way on subsets and
is (reasonably) fast.
}
\examples{
\dontrun{
  in_folder  <- "/home/lb/my_data/prasia/mosaics/ordered/subsets/Nueva_Ecijia/"
  out_folder <- file.path(in_folder, "decirc")
  decirc_phenorice(in_folder, out_folder)
}
}
\author{
Lorenzo Busetto, phD (2017) \href{mailto:lbusett@gmail.com}{lbusett@gmail.com}
}
