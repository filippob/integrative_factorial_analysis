
## script to read and preprocess phenotype data

library("tidyverse")

prjfolder = "~/Documents/ciampolini/anafibj"
infile = "data/feno_pisa.dat"

fname = file.path(prjfolder, infile)

writeLines(" - reading file")

format_cols = c("A8", # id
                "5X", # blanks
                "A7", # herd
                "A8", # date recording
                "I3", # Age
                "I3", # DIM
                "4A1", # Nm, Ese, Ncon, Ncam (??)
                "I3", # MY
                "I4", # fat
                "I4", # protein
                "A5", # SCC
                "I2", # lactation
                "2X", # blanks
                "I3", # days from last insemination
                "A1", # class of sire
                "A4", # flags
                "A5", # THI
                "A5", # humidity
                "A5" # max temperature
)

feno <- read.fortran(fname, format=format_cols)
names(feno) <- c("Id","Herd","date_control","Age","DIM","Nm","Ese","Ncon","Ncam",
                 "Milk","Fat","Protein","SCC","Parity","dli","Class","Flags","THI","Humidity","MaxT")

print(paste("From file", fname, nrow(feno), "records and", ncol(feno), "variables have been read"))

writeLines(" - data preprocessing")

# Conversion of some variables to numeric
print("1. format conversions")
feno$Nm = as.numeric(feno$Nm)
feno$Milk = as.numeric(feno$Milk)
feno$SCC = as.numeric(feno$SCC)
feno$THI = as.numeric(feno$THI)
feno$Humidity = as.numeric(feno$Humidity)
feno$MaxT = as.numeric(feno$MaxT)

# removing Ese and Ncam (just one value): positions 7 and 9
print("1. removing unnecessary variables (columns)")
feno = select(feno, -c(Ese,Ncam))

print("DONE!")