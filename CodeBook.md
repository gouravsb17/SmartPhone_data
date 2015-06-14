#Variables used:

1.)features: The names of the columns of the data.

2.)train: The training data loaded from the X_train.txt file.

3.)test: The testing data loaded from the X_test.txt file.

4.)final_set: Data set created by merging the train and the test data.

5.)initial & final: Feature number (303 to 344, 382 to 423, 461 to 502) which had duplicated names.

6.)req_dataset: Data set created from the final_set containing only the mean and std measurements of various columns.

7.)identity_train: Data from the subject_train.txt file.

8.)identity_test: Data from the subject_test.txt file.

9.)activity_train: Data from the y_train.txt file.

10.)activity_test: Data from the y_test.txt file.

11.)identity_set: Row Binding identity_train and identity_test datasets.

12.)activity_set: Row Binding activity_train and activity_test datasets.

13.) d : Grouping the Activity set data.

14.)data_step4: Column binding of identity_set , d and final_set  datastes.

15.)new_data5: New Data in step 5 which has been created by substituting the mean values for various columns for each activity for each subject.

#Data used(As supplied in the Data Set):

*1.)features.txt*
*2.)X_train.txt*
*3.)X_test.txt*
*4.)subject_train.txt*
*5.)subject_test.txt*
*6.)y_train.txt*
*7.)y_test.txt*
*8.)features.txt*

#Algorithm used:

Step 1.) The names of the columns are read from the text file features.txt and its second column is extracted and saved in the variable called features.

Step.2) Data is read from the text files X_train and X_test into the variables called train and test and then they are row binded into a new variable called final_set. (TASK: Merging of the training and test data complete).

Step.3) Then the columns have been named appropriately by removing the special characters( '-','(',')',',') and fixing the duplicate column names. This has been dne by visibly noting down the feature number (303 to 344, 382 to 423, 461 to 502). They have been changed accordingly to the x,y,z axis they represent.(TASK: Appropriately labels the data set with descriptive variable names complete).

Step.4) Using the select command from the dplyr package a new data set has been made called req-dataset which contains the mean and standard deviation values for the various measurements.(TASK: Extracts only the measurements on the mean and standard deviation for each measurement complete).

Step.5) The identity and the activity data for both training and testing set are read from the respective text files and saved into the variables called identity and activity set by row binding. Then using for loops the activty in the data is changed to its descriptive value as given in the data (i,e, 1= WALKING and so on).(TASK: Uses descriptive activity names to name the activities in the data set complete). The data_step4 is made by column binding the final_set, the identity-set and the activity_set.

Step.6) Finally the data_step4 is grouped by the subject_id and the activity. After that this is a bit tricky part we are asked to find the average of each column for each activity and for each subject, which means for 30 subjects with 6 activities we must have 180 rows of data. This has been done by first applying the sapply mean function to all columns except the first two. Then the sumarise is used on the above to find the required dataset using do.call function. 

Step.7) With this we come to the final task of printing the tidy data set of averages for all activities of each subject.(TASK: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject complete).






