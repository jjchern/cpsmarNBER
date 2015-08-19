# Download NBER March Supplement ------------

library(magrittr)
library(stringr)

# 1997 ------------

download.file("http://www.nber.org/cps/cpsmar97.zip", "cpsmar97.zip")
unzip("cpsmar97.zip")
unlink("cpsmar97.zip")

download.file("http://www.nber.org/data/progs/cps/cpsmar97.dct", "cpsmar97.dct")
download.file("http://www.nber.org/data/progs/cps/cpsmar97.do", "cpsmar97.do")

readLines("cpsmar97.dct") %>% 
  str_replace("/home/data/cps/cpsmar97.raw", "cpsmar97.dat") %>%
  writeLines("cpsmar97.dct")

readLines("cpsmar97.do") %>% 
  str_replace("log using cpsmar97, replace", "clear") %>% 
  str_replace("save cpsmar97,replace", "save cpsmar97,replace;") %>% 
  writeLines("cpsmar97.do")

system("/Applications/Stata/StataSE.app/Contents/MacOS//stata-se -b cpsmar97.do")

unlink("cpsmar97.dat")
unlink("cpsmar97.dct")
unlink("cpsmar97.do")
unlink("cpsmar97.log")