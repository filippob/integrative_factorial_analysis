
## script to read phenotype data

prjfolder = "~/Documents/ciampolini/anafibj"
infile = "data/feno_pisa.dat"

fname = file.path(prjfolder, infile)

writeLines(" - reading file")
feno <- read.fortran(fname, format=c("A8","5X","A7","A8","A3","A3","4A1","A3","A4","A4","A5","A2","2X","A3","A1","A4","A5","A5","A5"))
names(feno)<-c("Id","Herd","dat_control","Age","Days","Nm","Ese","Ncon","Ncam","Milk","Fat","Pro","Cell","Lac","Dp","Classe","Flags","THI","Hum","MaxT")

print(paste("From file", fname, nrow(feno), "records and", ncol(feno), "variables have been read"))

print("DONE!")