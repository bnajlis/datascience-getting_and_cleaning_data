library(dplyr)
# =================== ITEM 1 AND 4 ============================
# Read column (aka 'feature') names
colNames <- read.table(".//data//features.txt")
# Read train data set and assign column names
trainData <- read.table(".//data//train//X_train.txt",col.names = colNames$V2)
# Read train lables and add fixed 'Label' as column name
trainLabels <- read.table(".//data//train//Y_train.txt", col.names = c("activityId"))
# Read train subject data
trainSubject <- read.table(".//data//train//subject_train.txt", col.names = c("subjectId"))
# Bind train data and labels
allTrain <- cbind(trainData, trainLabels, trainSubject)
# Read test data set and assign column names
testData <- read.table(".//data//test//X_test.txt",col.names = colNames$V2)
# Read test labels and add fixed 'Label' as column name
testLabels <- read.table(".//data//test//Y_test.txt", col.names = c("activityId"))
# Read test data
testSubject <- read.table(".//data//test//subject_test.txt", col.names = c("subjectId"))
#Bind test data and labels together
allTest <- cbind(testData, testLabels, testSubject)
# Combines train and test data
allData <- rbind(allTest, allTrain)
rm(colNames, trainData, testData, allTrain, allTest, testLabels, testSubject, trainLabels, trainSubject)

#================== ITEM 2 ==============================
subsetData <- select(allData, matches("std|mean|activityId|subjectId"))
rm(allData)

#================== ITEM 3 ===============================
# Read Activity Labels
activityLabels <- read.table(".//data//activity_labels.txt", col.names=c("activityId", "activityName"))
# Do Join
labeledData <- left_join(subsetData, activityLabels, by="activityId")

rm(activityLabels, subsetData)

# ============= ITEM 5 ====================================
tidyData <- labeledData %>% group_by(subjectId, activityName) %>% summarise_each(funs(mean)) %>% select(-activityId)

rm(labeledData)

write.table(tidyData, row.names = FALSE, file = "tidyData.txt")
