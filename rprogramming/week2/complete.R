complete <- function(directory, id = 1:332) {
  complete_obs <- data.frame(id=numeric(), nobs=numeric())
  files <- list.files(directory, full.names = TRUE)
  dimnames(complete_obs) <- list(c(), c("id", "nobs"))
  
  for (i in id) {
    complete_obs[nrow(complete_obs) + 1, ] = build_row(i, files)
  }
  complete_obs
}

build_row <- function(i, files) {
  c(i, sum(complete.cases(read.csv(files[i]))))
}