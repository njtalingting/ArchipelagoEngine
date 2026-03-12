#' Philippine Provincial Map (81 Provinces)
#'
#' A processed \code{sf} object of the Philippines used to validate archipelagic
#' spatial weights. This dataset serves as the benchmark for bridging
#' fragmented maritime networks.
#'
#' @format An \code{sf} object with 81 rows and geographic boundaries:
#' \itemize{
#'   \item \strong{Standard Queen Connectivity}: 80.2\% (16 isolated units)
#'   \item \strong{ArchipelagoEngine (k=5) Connectivity}: 100.0\% (0 isolated units)
#' }
#' @source \url{https://gadm.org/} and research by Nino Jay Talingting.
"raw_data"
