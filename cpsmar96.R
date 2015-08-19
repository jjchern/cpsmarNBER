# Download NBER March Supplement ------------

library(magrittr)
library(stringr)

# 1996 ------------

download.file("http://www.nber.org/cps/cpsmar96.zip", "cpsmar96.zip")
unzip("cpsmar96.zip")
unlink("cpsmar96.zip")

download.file("http://www.nber.org/data/progs/cps/cpsmar96.dct", "cpsmar96.dct")
download.file("http://www.nber.org/data/progs/cps/cpsmar96.do", "cpsmar96.do")

readLines("cpsmar96.dct") %>% 
  str_replace("/home/data/cps/cpsmar96.raw", "cpsmar96.dat") %>% 
  writeLines("cpsmar96.dct")

readLines("cpsmar96.do") %>% 
  str_replace("log using cpsmar96, replace", "clear") %>% # no log
  str_replace("save cpsmar96,replace", "save cpsmar96,replace;") %>% # added a ";" 
  writeLines("cpsmar96.do")

system("/Applications/Stata/StataSE.app/Contents/MacOS//stata-se -b cpsmar96.do")

unlink("cpsmar96.dat")
unlink("cpsmar96.dct")
unlink("cpsmar96.do")
unlink("cpsmar96.log")