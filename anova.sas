
/*	Author - Anupama Rajaram
	Function - DV Tools week1 assignment
	ANOVA analysis between categorical and quantitative variable.
		a.	Relationship between number of casual renters based on season.
		b.	Relationship between total renters based on weather conditions.

	Dataset link: 	https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset
	File used = day.csv
	
	Graphical Results and analysis explanation can also be found at the blog post
	link below:
	https://journeyofanalytics.wordpress.com/2015/11/22/anova-testing-week1-assignment/

*/

data bikedata; 
   infile " /home/sunshinegirl48860/sasuser.v94/day.csv" 
   DELIMITER = ',' firstobs = 2;
   Input instant dteday season yr mnth holiday weekday workingday weathersit temp atemp
   hum windspeed casual registered cnt; 

/* Giving labels to variable names for better understanding */
LABEL 	weathersit = "Weather"
		cnt = "Count"
		Season = "Season"
		temp = "Temperature"
		casual = "Casual Users"
		registered = "Member Users";
		
/* 	Computing frequency distribution for 5 variables  */
PROC FREQ DATA = bikedata;
	TABLES season weathersit;
	
PROC ANOVA; CLASS season;
MODEL casual=season;
MEANS season/duncan;	

PROC ANOVA; CLASS weathersit;
MODEL cnt=weathersit;
MEANS weathersit/duncan;

RUN; 
