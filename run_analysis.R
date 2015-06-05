run_analysis <- function(){
  
  features<- read.table("features.txt",colClasses = "character")
  features<- features[2]
  train <- read.table("X_train.txt")
  test <- read.table("X_test.txt")
  #Task 1: Merges the training and the test sets to create one data set.
  final_set<- rbind(train,test)
  #print(dim(final_set))
  
  #Task 4:Appropriately labels the data set with descriptive variable names. 
  
  names(final_set)<- features[[1]]
  #Removing the special characters
  names(final_set)<- gsub("-","",names(final_set))
  names(final_set)<- gsub("\\(|\\)|\\,)","",names(final_set))
  #Fixing the DUPLICATE Column Names
  for (j in 1:3){
    if (j==1){initial<- 303
              final<- 344}
    if (j==2){initial<- 382
              final<- 423}
    if (j==3){initial<- 461 
              final<- 502} 
  for (i in initial : final)
  {   
    g<- names(final_set)[i]    
    if (i>=initial & i<initial+14)
      names(final_set)[i]<- sub("Energy","EnergyX",g)
    if (i>=initial+14 & i<initial+28)
      names(final_set)[i]<-sub("Energy","EnergyY",g)
    if (i>=initial+28 & i<initial+42)
      names(final_set)[i]<- sub("Energy","EnergyZ",g)    
  } 
  }
  
  #Task 2:Extracts only the measurements on the mean and standard deviation for 
  ##      each measurement.
  
  req_dataset<-select(final_set,contains("mean",ignore.case = TRUE),contains("std",ignore.case = TRUE))
  print(group_by(req_dataset))
  #Task 3:Uses descriptive activity names to name the activities in the data set.
  
  identity_train<- read.table("subject_train.txt")
  identity_test<- read.table("subject_test.txt")
  activity_train<- read.table("y_train.txt")
  activity_test<- read.table("y_test.txt")
  
  identity_set<- rbind(identity_train,identity_test)
  activity_set<- rbind(activity_train,activity_test)
  
  names(identity_set)<- c("Subject_id")
  names(activity_set)<- c("activity")
 
  d<- group_by(activity_set)
  for (i in 1 : dim(d)[1]){
   if(d[i,]==1){d[i,] <- "WALKING" }
   if(d[i,]==2){d[i,] <- "WALKING_UPSTAIRS" }
   if(d[i,]==3){d[i,] <- "WALKING_DOWNSTAIRS" }
   if(d[i,]==4){d[i,] <- "SITTING" }
   if(d[i,]==5){d[i,] <- "STANDING" }
   if(d[i,]==6){d[i,] <- "LAYING" }
   }
  data_step4<- cbind(identity_set,d,final_set)
  
  #Task 5:From the data set in step 4, creates a second, independent tidy data set
  ##      with the average of each variable for each activity and each subject.
  data_step4<- group_by(data_step4,Subject_id,activity)
  cols <- names(data_step4)[-(1:2)]
  dots <- sapply(cols ,function(x) substitute(mean(x), list(x=as.name(x))))
  new_data5<- do.call(summarise, c(list(.data=data_step4), dots))
  write.table(new_data5,file="data_set_step5.txt",row.names = FALSE)
  print(new_data5)

}
