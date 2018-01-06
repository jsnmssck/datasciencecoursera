pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## get the files from the directory based on id
  dat <- load_data(directory, id)
  
  ## take mean
  mean(dat[[pollutant]], na.rm = TRUE)
}

load_data <- function(directory, id) {
  dat <- data.frame()
  files <- list.files(directory, full.names = TRUE)
  for (i in id) {
    dat <- rbind(dat, read.csv(files[i]))
  }
  dat
}
