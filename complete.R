complete <- function(directory, id = 1:332){
    
    # Reads a directory of files and reports the number of completely observed
    # cases in each data file.  Returns a data frame where the first column is
    # the name of the file and the second column is the number of complete cases
    
    # Index data directory w/ relative path
    files <- list.files(directory, full.names = TRUE)
    
    # Create an empty dataframe 
    dat <- data.frame()
    
    # Loop that opens each data file, counts complete cases, then rbinds data
    # to a new row.
    
    for(i in id){
        dat_temp <- data.frame() # initialize blank temp dataframe for import
        dat_temp <- read.csv((files[i])) # read in file
        
        # count complete cases and store
        complete <- length(complete.cases(na.omit(dat_temp))) 
        
        dat <- rbind(dat, c(i, complete))
    }
    
    # Name Columns
    colnames(dat) <- c("id", "nobs")
    
    head(dat)
}