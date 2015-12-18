
corr <- function(directory, threshold = 0) {
  cors<-numeric(0)
  fullData<-complete(directory)
  thresholdData<-fullData[fullData$nobs>threshold,]
  for(i in thresholdData$id){
    filename<-paste0(directory,"/",i,".csv")
    data<-read.csv(filename)
    full_data<-data[complete.cases(data),]
    catomic <-cor(full_data$sulfate,full_data$nitrate)
    cors<-append(cors,catomic)
  }
  return(cors)
}
#TEST
cr<-corr("specdata",150)
head(cr)
summary(cr)

cr<-corr("specdata",400)
head(cr)
summary(cr)

cr<-corr("specdata",5000)
summary(cr)
length(cr)

cr<-corr("specdata")
summary(cr)
length(cr)