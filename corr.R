corr <- function(directory = "specdata", threshold = 0){
   
    # Calculates the correlation between nitrate and sulfate for sites that have
    # sufficient complete observed cases (threshold).  Returns a vector of the 
    # correlations for the monitors that meat the requirement.  If no monitors
    # meet the requirement, the functions returns a vector of length 0.
    
    # Produce a dataframe of complete records using the complete.R script
    
    # create a list of files
    files <- list.files(directory, full.names = TRUE)
    
    # source the Complete.R function to make a list of ids and number good
    source("complete.R")
    list_complete <- complete(directory)
    
    #create empty correlation vector
    correlated <- numeric()
    
    #create a vector of sites that meets threshold
    meets <- list_complete[which(list_complete[, 'nobs'] > threshold), "id"]
    
    #loop over good station ids, pull from file list, correlate & append
    for(i in meets){
        meets_temp <- data.frame() # create empty data frame
        meets_temp <- read.csv((files[i])) # read in data frames meeting th
        whole <- na.omit(meets_temp) # cull NA values
        # correlate nitrate and sulfate columns
        cor_temp <- cor(whole[, "sulfate"], whole[, "nitrate"])
        # append correlated value to vector
        correlated <- c(correlated, cor_temp)
        
    }
    
    correlated
    
}