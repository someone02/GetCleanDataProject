library(dplyr)

get_feat_name_vector <- function(data_dir) {
  read.table(paste(data_dir, "/features.txt", sep=""), 
             col.names=c("idx", "feat_name"))[,"feat_name"]
}

get_activity_label <- function(data_dir) {
  read.table(paste(data_dir, "/activity_labels.txt", sep=""),
             col.names=c("activity", "activityLabel"))
}

read_data <- function(data_dir, data_set) {
  # Get names of the columns
  feat_name <- get_feat_name_vector(data_dir)
  # Get sub-directory of the data set
  subdir <- paste(data_dir, "/", data_set, "/", sep="")
  # Get names of the files to be read
  feat_file  <- paste(subdir, "X_", data_set, ".txt", sep="")
  label_file <- paste(subdir, "y_", data_set, ".txt", sep="")
  subj_file  <- paste(subdir, "subject_", data_set, ".txt", sep="")
  # Read in the data files
  feat  <- read.table(feat_file, col.names=feat_name)
  label <- read.table(label_file, col.names=c("activity"))
  subj  <- read.table(subj_file, col.names=c("subject"))
  # Concatenate them and return
  cbind(subj, feat, label)
}

run_analysis <- function(data_dir) {
  ## 'data_dir' is a character vector indicating the directory
  ## containing the dataset
  
  ## Returns a dataframe of the form
  ## subject activityLabel ...
  ## where 'subject' is the subject id
  ## 'activityLabel' is the activity 
  ## and the subsequent columns contain the average mean/std feature
  ## over the specific 'subject' and 'activityLabel'
  
  ## (1) Merges the training and the test sets to create one data set
  ## (4) Appropriately labels the data set with descriptive variable names. 
  # Read in training data
  df <- read_data(data_dir, "train")
  # Bind with test data
  df <- rbind(df, read_data(data_dir, "test"))
  
  ## (2) Extracts only the measurements on the mean and standard deviation
  ##     for each measurement. 
  # Use select from dplyr package to pick up variables with names
  # containing ".mean." and ".std."
  # This is to avoid confusion with the meanFreq and additional vectors
  df <- cbind(select(df, subject,
                     contains(".mean.", ignore.case=FALSE),
                     contains(".std." , ignore.case=FALSE),
                     activity))
  
  ## (3) Uses descriptive activity names to name the activities in the data set
  # Get activity table
  activity <- get_activity_label(data_dir)
  # Perform a left join
  df <- left_join(df, activity)
  # Remove the numeric activity variable
  df <- select(df, -activity)
  
  ## (5) From the data set in step 4, creates a second, independent tidy data 
  ##     set with the average of each variable for each activity and each subject.
  # Group by subject and activityLabel
  # And then use summarise each to apply mean to each column
  dfAvg <- summarise_each(group_by(df, subject, activityLabel),
                          funs(mean))
}
