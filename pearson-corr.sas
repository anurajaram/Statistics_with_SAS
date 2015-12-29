/*	Author - Anupama Rajaram
	Function - Pearson correlation test between 2 quantitative variables
	
	Disclaimer - value for Pearson correlation coefficient ranges between [-1, +1]
	However, the value is high only if there is a strong "linear" relationship.
	Hence always compare results with a graph. 
	*/

data bikedata; 
   infile " /home/sunshinegirl48860/sasuser.v94/day.csv" 
   DELIMITER=',';
   Input instant dteday season yr mnth holiday weekday workingday weathersit temp atemp
   hum windspeed casual registered cnt; 

/* Giving labels to variable names for better understanding */
LABEL 	weathersit = "Weather"
		cnt = "Count"
		Season = "Season"
		temp = "Temperature"
		casual = "Casual Users"
		registered = "Member Users";
		

/* 	Pearson Correlation - we can calculate multiple relationships
	using just one line of code! :) */
	Proc corr;
	var temp mnth season casual;
