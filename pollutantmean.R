pollutantmean <- function(directory, pollutant, id = 1:332) {
  mean_Data <- c()
  id_name <- sprintf("%03d", id)
  for (i in id_name) {
    filename <- paste0(directory,"/",i,".csv")
    data <- read.csv(filename)
    mean_Data <- rbind(mean_Data, data)
  }
  if (pollutant == "sulfate") {
    return(mean(mean_Data$sulfate, na.rm = TRUE))
  } else if (pollutant == "nitrate") {
    return(mean(mean_Data$nitrate, na.rm = TRUE))
  } else {
    return(NA)
  }
}
#test
pollutantmean("specdata","sulfate",1:10)
pollutantmean("specdata","nitrate",70:72)
pollutantmean("specdata","nitrate",23)
