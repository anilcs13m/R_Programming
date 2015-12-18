complete <- function(directory,id = 1:332) {
  fullData <- data.frame()
  id_name <- sprintf("%03d", id)
  for (i in id_name) {
    filename <- paste0(directory,"/",i,".csv")
    data <- read.csv(filename)
    id_nods<-data.frame("id"=i,nobs = nrow(data[complete.cases(data),]))
    fullData <- rbind(fullData, id_nods)
  }
  return(fullData)
}
#test
complete("specdata",1)
complete("specdata",c(2,4,8,10,12))
complete("specdata",30:25)
complete("specdata",3)
