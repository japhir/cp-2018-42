# Zachos 2008 stack
zachos <- read.csv("data/Zachos2008.csv", stringsAsFactors = FALSE)
zachos <- zachos[, c(2, 5, 4)]
names(zachos) <- c("age", "d13c", "d18o")
zachos$age <- zachos$age * 1000

## Pälike ODP Leg 199 Site 1218
pal <- read.csv("data/Pälike_clean.csv") # newly acquired via Margot Cramwinckel
pal$age <- pal$age * 1000  # from Mya to kya
pal$auth <- as.factor(rep("Palike", nrow(pal)))

# Beddow IODP site U1334
bed <- read.delim("data/320-U1334_d18O-d13C.tab", # raw data from repo
                  skip = 14, stringsAsFactors = FALSE, sep = "\t")
# bed <- bed[, -1] # omit depth
names(bed) <- c("depth", "age", "d13c", "d18o")

# Holbourn site U1337
hol <- read.delim("data/321-U1337_isotope_benth_foram.tab", # raw data from repo
                  sep = "\t", header = TRUE, skip = 19, stringsAsFactors = FALSE)
hol <- hol[, 5:8]
names(hol) <- c("depth", "age", "d13c", "d18o")
hol$auth <- as.factor(rep("Holbourn", nrow(hol)))

# Tian site U1337
## tian <- read.csv("data/Tian_U1337.csv", stringsAsFactors = FALSE) # 16.3 - 12.9
## site U1337 hole C and D, using combined depth
## sheet headers:
## Site Hole Core Type Section top(cm) Species CSF-A_new (m) offset_Roy_final CCSF-A_Royfinal (m) Age(ka) Cibicidoides δ13C Cibicidoides δ18O
tian <- read.csv("data/Tian_U1337_all.csv", stringsAsFactors = FALSE) # from raw excel file, exported to .csv
## 16.3 - 12.9 
## experiment with which depth column to use
## tian <- tian[, c("CSF.A_new..m.", "Age.ka.", "Cibicidoides.δ13C", "Cibicidoides.δ18O")]
tian <- tian[, c("CCSF.A_Royfinal..m.", "Age.ka.", "Cibicidoides.δ13C", "Cibicidoides.δ18O")]
names(tian) <- c("depth", "age", "d13c", "d18o")
tian$auth <- as.factor(rep("Tian", nrow(tian)))
