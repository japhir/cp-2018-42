# if you don't have astrochron installed, type `install.packages("astrochron")'
library(astrochron)  # for linear interpolation and mtm analysis
source("scripts/read_data.R")

## start with Palike, ignore Beddow for now
comp <- cbind(depth = rep(NA, nrow(pal)), pal)
comp$depth <- as.numeric(comp$depth)
## omit low resolution section and overlap with Holbourn from Palike
comp <- comp[comp$age < 34e3, ] # high res
comp <- comp[comp$age > max(hol$age), ] # overlap omitted from Palike
# add holbourn 2015 U1337
comp <- rbind(comp, hol)
# add Tian 2013 U1337
## subset to exclusive region
comp <- rbind(comp, tian[tian$depth < min(comp$depth, na.rm = T), ])
## order by age
comp <- comp[order(comp$age), ]

## copies for further use
d13c <- comp[, c(2, 3, 5)]
d13c <- d13c[complete.cases(d13c), ]
d18o <- comp[, c(2, 4, 5)]
d18o <- d18o[complete.cases(d18o), ]

## NOTE: there are some duplicate values for certain ages, as well as varying
## values for the same age.

## linear interpolation
d13c.lin <- linterp(d13c, dt = 4, genplot = F, verbose = F)
d18o.lin <- linterp(d18o, dt = 4, genplot = F, verbose = F)
## mtm spectra
d13c.mtm <- mtm(data.frame(d13c.lin[, 1]/1e3, d13c.lin[, 2]), xmax = 0.012, ntap = 5, output = 1, genplot = F, verbose = F)
d18o.mtm <- mtm(data.frame(d18o.lin[, 1]/1e3, d18o.lin[, 2]), xmax = 0.012, ntap = 5, output = 1, genplot = F, verbose = F)

## write output files
write.csv(comp, "out/rawcomposite.csv", row.names = F)
write.csv(d13c, "out/d13c_rawcomposite.csv", row.names = F)
write.csv(d13c.lin, "out/d13c_rawcomposite_linterp.csv", row.names = F)
write.csv(d13c.mtm, "out/d13c_rawcomposite_mtm.csv", row.names = F)

write.csv(d18o, "out/d18o_rawcomposite.csv", row.names = F)
write.csv(d18o.lin, "out/d18o_rawcomposite_linterp.csv", row.names = F)
write.csv(d18o.mtm, "out/d18o_rawcomposite_mtm.csv", row.names = F)
