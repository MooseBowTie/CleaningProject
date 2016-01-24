# Getting and Cleaning Data Course Project


# Load the space-delimitted data 
# Some values have one space between them and some have two, which is terrible
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")

# Attach the y columns to the end of train and test
train$activity <- as.numeric(read.table("UCI HAR Dataset/train/y_train.txt")[[1]])
test$activity <- as.numeric(read.table("UCI HAR Dataset/test/y_test.txt")[[1]])

# Merge the train and test sets
data <- rbind(train, test) 

# Load the subject data
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Add a column for the subject ID
data$subjectID <- c(trainSubjects[, 1], testSubjects[, 1])

# Load the list of feature names
featureNames <- read.table("UCI HAR Dataset/features.txt")

# Get a logical vector that is TRUE for the mean and standard deviation columns 
# The meanFreq() and gravityMean columns are left out
mean_std_names <- grepl("mean\\()|std\\()", as.character(featureNames[[2]]))

# Create a smaller data frame using only the mean and std columns, and the activity column
smallData <- data[, c(mean_std_names, TRUE, TRUE)] # The two extra TRUE's ensure the activity label and subject columns are kept

# Convert the numbers 1 to 5 in the activity column to descriptive labels
smallData[[67]] <- factor(smallData[[67]])
levels(smallData[[67]]) <- c("walking", "walkingUpstairs", "walkingDownstairs", "sitting", "standing", "laying")

# Add descriptive column names
names(smallData) <- c(as.character(featureNames[mean_std_names, 2]), "activity", "subjectID") # Start with the names from the features file
names(smallData)[1:66] <- gsub("-|\\(|\\)", "", names(smallData)[1:66]) # Remove unwanted characters: "-"   "("   ")"
names(smallData)[1:66] <- gsub("mean", "Mean", names(smallData)[1:66]) # Add some capitals to increase readability
names(smallData)[1:66] <- gsub("std", "StandardDev", names(smallData)[1:66]) # Change std to StandardDev to increase readability
names(smallData)[1:66] <- gsub("BodyBody", "Body", names(smallData)[1:66]) # Replace BodyBody with Body



# Create another data set, with the average of each variable, for each activity and subject
# First, I will make a data frame with a row for each variable,
# and 181 columns (variable name + 30 subjects * 6 activities).
# There will be one column for each subject/activity pair

# Create a new data frame and put the variable names in the first column
variableAverages <- data.frame(names(smallData)[1:66])
variableAverages[, 1] <- as.character(variableAverages[, 1]) # Convert this column to character class
names(variableAverages) <- "variableNames" # Name the first column

# Create the other column names, and initialize the values to NA
for(i in 1:30)
{     colName <- paste("sub", i, "_", "walking", sep="")
      variableAverages[[colName]] <- NA
      colName <- paste("sub", i, "_", "walkingUpstairs", sep="")
      variableAverages[[colName]] <- NA
      colName <- paste("sub", i, "_", "walkingDownstairs", sep="")
      variableAverages[[colName]] <- NA
      colName <- paste("sub", i, "_", "sitting", sep="")
      variableAverages[[colName]] <- NA
      colName <- paste("sub", i, "_", "standing", sep="")
      variableAverages[[colName]] <- NA
      colName <- paste("sub", i, "_", "laying", sep="")
      variableAverages[[colName]] <- NA
}

# For each subject/activity pair, calculate the mean of each variable

# Split by subject-id
splitData <- split(smallData, smallData$subjectID)

# For each subject_id, split by activity
for(i in 1:30)
{     doublySplitData <- split(splitData[[i]], splitData[[i]]$activity)
      
      # For each element in the resulting list, calculate the mean of each variable
      # Loop through the elements of the list (each element being a data frame)
      for(j in 1:length(doublySplitData))
      {     # Loop through each column of the data frame and calculate the mean
            for(k in 1:66)
            {     m <- mean(doublySplitData[[j]][, k])
                  
                  # Insert this mean into the new data frame
                  activ <- doublySplitData[[j]]$activity[1] # Get the name of the current activity
                  colName <- paste("sub", i, "_", activ, sep="") # Get the name of the column
                  variableAverages[k, colName] <- m
            }
      }
}

# Replace the first column with actual row names
row.names(variableAverages) <- variableAverages[, 1] # Set the actual row names to the entries of the first column
variableAverages <- variableAverages[, 2:181] # Delete the first column

# Now I'll traspose the data frame, to get the variables in the columns and subject/activity combos as rows
variableAverages <- t(variableAverages)

# Move the row names to the first row
# This is done because it was suggested that the table be written using the row.name=FALSE parameter
variableAverages <- cbind(row.names(variableAverages), variableAverages)
variableAverages <- as.data.frame(variableAverages)
names(variableAverages) <- c("subjectActivities", names(variableAverages)[2:67])

# Write using write.table() instead
write.table(variableAverages, "variableMeans.txt", row.name=FALSE)







