corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  frames <- lapply(files, read.csv)
  obs_over_thr <- sapply(frames, is_over_threshold, threshold)
  relevant <- frames[obs_over_thr]
  sapply(relevant, correlate)
}

is_over_threshold <- function(f, t) {
  sum(complete.cases(f)) > t
}

correlate <- function(df) {
  full_obs <- df[complete.cases(df), ]
  sulfate <- full_obs[,2]
  nitrate <- full_obs[,3]
  cor(sulfate, nitrate)
}