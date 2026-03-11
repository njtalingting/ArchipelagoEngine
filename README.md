# ArchipelagoEngine <img src="CRAN Logo (1).png" align="right" height="100" />
[![](https://www.r-pkg.org/badges/version/ArchipelagoEngine)](https://cran.r-project.org/package=ArchipelagoEngine)

Standard spatial contiguity models often leave significant portions of island nations mathematically isolated. In the Philippine context, standard Queen logic leaves 16 provinces (approx. 20%) orphaned, resulting in a fragmented network with only 80.2% connectivity. This fragmentation introduces systematic predictive bias and significant residual spatial autocorrelation (e.g., Moran's $I=0.024$, $p<0.05$ in the Philippines).

`ArchipelagoEngine` implements specialized K-Nearest Neighbor (KNN) logic to bridge these fragmented maritime networks. By enforcing a unified grid (optimized at $k=5$ using the Philippines as case study), the engine achieves 100% network connectivity and neutralizes spatial bias, enabling robust econometric inference for fragmented topographies, public health mapping, among other applications.

## Key Features
* **100% Connectivity**: Ensures no island units are mathematically "orphaned."
* **Bias Neutralization**: Reduces Moran’s I to approximately 0 ($p > 0.10$) to stabilize spatial spillovers.
* **Structural Robustness**: Prioritizes structural integrity and randomized residuals over superficial model fit.
* **CRAN Verified**: Fully compatible with standard spatial regression workflows using `sf` and `spdep`.

## Installation

You can install the released version of **ArchipelagoEngine** from [CRAN](https://CRAN.R-project.org/package=ArchipelagoEngine) with:

```R
install.packages("ArchipelagoEngine")
```
## Quick Start
The core function, build_archipelago_weight, bridges fragmented networks using optimized KNN logic.
```R
library(ArchipelagoEngine)
library(sf)
library(spdep)

# Load the benchmark map
data(raw_data)

# Calculate the new network based on the k=5 logic
weights <- build_archipelago_weight(raw_data, k = 5)

# Scans the graph to see if any islands are isolated
# If this returns 1, the computer has verified 100% connectivity
connectivity_status <- spdep::n.comp.nb(weights$neighbours)$nc
print(connectivity_status)

# Plot connectivity
plot(st_geometry(raw_data), border = "lightgrey")
plot(weights$neighbours, st_coordinates(st_centroid(raw_data)), 
     add = TRUE, col = "#1E90FF", pch = 19, cex = 0.5, lwd = 0.7)

# Result status
mtext(paste("Status: 100% Connectivity Achieved (nc =", connectivity_status, ")"), 
      side = 1, line = 1, adj = 0.5, cex = 0.9, font = 1, col = "#2C3E50")
```
## Research Roadmap
v0.1.1 (Current): Established topological baselines for fragmented islands.

Active Development: Transitioning from static to dynamic modeling by integrating scraped AIS (Automatic Identification System) satellite data.

Field Calibration: Currently ground-truthing maritime friction variables against real-world bottlenecks and monsoons at the Port of Cebu.

## Documentation
For a deep dive into the underlying methodology—including applications of Anselin (1988) and LeSage and Pace (2009)—refer to [Package Manual](https://www.r-pkg.org/pkg/ArchipelagoEngine)
