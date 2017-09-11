pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    # Get dataframe containing all CSV files
    
    files <- list.files(directory, full.names = TRUE) # Get list of all files
    dat <- data.frame() # create empty data frame
    
    # loop over selected files in directory and bind to dat dataframe
    for(i in id){
        dat <- rbind(dat, read.csv(files[i]))
    }
    
   # Take mean of selected pollutant data, removing NA 
    mean(dat[, pollutant], na.rm = TRUE)
}