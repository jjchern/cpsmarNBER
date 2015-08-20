# About This Repository

This repo contains R scripts that download the March CPS Supplement files 
(Stata's .dta files) from the NBER data website. It requires Stata installed.

# Usage

To download the 1996 March CPS file:

```r
library(downloader)
source_url("https://raw.githubusercontent.com/jjchern/cpsmar/master/cpsmar96.R", prompt = FALSE)
```