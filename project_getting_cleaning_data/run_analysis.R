library(plyr)
library(dplyr)


#Downloading the data from internet and unzipping zipped folder

downloadfile.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
downloadfile.dir <- "UCI HAR Dataset"
downloadfile.file <- "Dataset.zip"


if (!file.exists(paste(downloadfile.dir,downloadfile.file, sep = "/"))) {
  download.file(url = downloadfile.url, destfile = paste(downloadfile.dir,downloadfile.file, sep = "/") )
}

downloadfile.path <- paste(downloadfile.dir,downloadfile.file, sep = "/")

unzip(downloadfile.path)

#Reading lines of the text file

pathlist <- list(
  train.subject = file.path(downloadfile.dir, "train", "subject_train.txt"),
  train.x = file.path(downloadfile.dir, "train", "X_train.txt"),
  train.y = file.path(downloadfile.dir, "train", "y_train.txt"),
  test.subject = file.path(downloadfile.dir, "test", "subject_test.txt"),
  test.x = file.path(downloadfile.dir, "test", "X_test.txt"),
  test.y = file.path(downloadfile.dir, "test", "y_test.txt")
)

lines <- sapply(pathlist, readLines, n=10)

field_width.train <- sapply(lines[,2], nchar,USE.NAMES = FALSE)/561
field_width.test <- sapply(lines[,5], nchar,USE.NAMES = FALSE)/561
all(field_width.train == field_width.test)
field_width <- field_width.test[1]


#Reading files into separate dataframes

df1 <- read.delim(file.path(downloadfile.dir, "train", "subject_train.txt"), sep="", col.names = "Subject Id", colClasses = "factor", header = FALSE)
df2 <- read.delim(file.path(downloadfile.dir, "test", "subject_test.txt"), sep="", col.names = "Subject Id", colClasses = "factor", header = FALSE)
df3 <- read.delim(file.path(downloadfile.dir, "train", "y_train.txt"), sep="", col.names = "Activity", colClasses = "factor", header = FALSE)
df4 <- read.delim(file.path(downloadfile.dir, "test", "y_test.txt"), sep="", col.names = "Activity", colClasses = "factor", header = FALSE)
df5 <- read.fwf(file.path(downloadfile.dir, "train", "X_train.txt"),widths=rep(field_width,561), header=FALSE, colClasses="numeric")
df6 <- read.fwf(file.path(downloadfile.dir, "test", "X_test.txt"),widths=rep(field_width,561), header=FALSE, colClasses="numeric")


#Seeing dimensions of the loaded dataframes

dim(df6)
dim(df5)
dim(df4)
dim(df3)
dim(df2)
dim(df1)


#Merging the 6 dataframes to one dataframe

merged_df <- bind_rows(bind_cols(df1,df3,df5), bind_cols(df2,df4,df6))


#Changing Activity number to Activity name
activity_label_df <- read.delim(file.path(downloadfile.dir,"activity_labels.txt"), sep=" ", col.names=c("Activityid", "Activityname"), colClasses = c("factor","character"), header=FALSE)
activity_label_df <-  mutate(activity_label_df,Activityname = tolower(gsub("_", " ", Activityname)))
merged_df$Activity <- mapvalues(x = merged_df$Activity, from = activity_label_df$Activityid, to = activity_label_df$Activityname)


#Bringing names of measured variables to consolidated dataframe
features_df <- read.delim(file.path(downloadfile.dir,"features.txt"), sep = " ", col.names = c("featureid", "featurename"), colClasses = c("numeric","character"), header = FALSE)
features_df$featureid <- paste0("V",features_df$featureid)
var_names <- features_df$featurename
names(merged_df)[-c(1,2)] <- var_names

#Filtering for only mean and standard deviation for measured variables
merged_df_extr <- merged_df[,grep(pattern = "mean\\()|std\\()|Subject.Id|Activity", names(merged_df))]

#names(merged_df) <- gsub(pattern = "[()]" , replacement = "",names(merged_df) )

#Creating grouped mean
merged_df_grouped <- group_by(merged_df_extr, Subject.Id, Activity)
merge_df_group_summarised <- summarise_all(merged_df_grouped, mean)

#Writing 2 dataframes to a csv file and answer dataset to a txt file
write.csv(x = merged_df_extr, file = "merged_dataframe.csv")
write.csv(x = merge_df_group_summarised, file = "merged_dataframe_grouped_and_summarised.csv")

write.table(x = merge_df_group_summarised, file = "merged_dataframe_grouped_and_summarised.txt", row.names = FALSE)



