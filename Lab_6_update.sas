/*Lab 6*/

/*OUTPUT statement*/

/*1. Output Multiple Datasets*/

DATA morning afternoon;
   INFILE 'C:\Users\SSMS1302-03\Desktop\Lab6\Zoo.dat';
   INPUT Animal $ 1-9 Class $ 11-18 Enclosure $ FeedTime $;
   IF FeedTime = 'am' THEN OUTPUT morning;
      ELSE IF FeedTime = 'pm' THEN OUTPUT afternoon;
      ELSE IF FeedTime = 'both' THEN OUTPUT;
      /* not specify a dataset, will add these obs to both datasets*/
RUN;

Proc print Data=morning;
title 'Animals with morning Feedings';
run;

proc print data=afternoon;
title 'Animals with afternoon Feedings';
run;





/*2. Output Multiple OBS from 1 OBS*/
Title;
Data Squared;
Do x = 1 to 5;
y = x**2;
output;
End;
run;
proc print; run;

Data Squared;
Do x = 1 to 5;
y = x**2;
*output;
End;
run;
proc print; run;






/*Another example to create multiple observatiosn from 1 obs -
 Using output and trailing @*/
DATA ticket_sales;
	INPUT	Month $ Location $ Tickets @ ;
		OUTPUT;
	INPUT	Location $ Tickets @ ;
		OUTPUT;
	INPUT	Location $ Tickets ;
		OUTPUT;
	DATALINES;
	Jan Varsity 56723 Downtown 69831 Super-6 70025
	Feb Varsity 62137 Downtown 43901 Super-6 81534
	Mar Varsity 49982 Downtown 55783 Super-6 69800
;
RUN;

PROC PRINT;
RUN;

*Difference between the @ and @@;
* @@ will hold the record untill the end of record;
DATA ticket_sales;
	INPUT	Month $ Location $ Tickets @ ;
		OUTPUT;
	DATALINES;
	Jan Varsity 56723 Downtown 69831 Super-6 70025
	Feb Varsity 62137 Downtown 43901 Super-6 81534
	Mar Varsity 49982 Downtown 55783 Super-6 69800
;
RUN;

PROC PRINT;
RUN;



/* Correct Version*/
DATA ticket_sales;
	INPUT	Month $ Location $ Tickets @@ ;
	OUTPUT;
	DATALINES;
	Jan Varsity 56723 Downtown 69831 Super-6 70025
	Feb Varsity 62137 Downtown 43901 Super-6 81534
	Mar Varsity 49982 Downtown 55783 Super-6 69800
;
RUN;

PROC PRINT;
RUN;





/*RETAIN and Sum Statement*/
	*Keep the value from 1 iteration of the datastep to the next;

/* Using RETAIN and SUM statements to find Most runs and Total runs*/

*MAX Runs;
DATA game_max;
   INFILE 'C:\Users\SSMS1302-03\Desktop\Lab6\Games.dat';
   INPUT Month 1 Day 3-4 Team $ 6-25 Hits 27-28 Runs 30-31;
   MaxRuns = MAX(MaxRuns, Runs);
   RETAIN MaxRuns;
  /*retain statement can be put anywhere inside the data step*/

RUN;
PROC PRINT;
TITLE "Season's Record - Max Run";
RUN;


*Total Runs - SUM statement;
DATA game_total;
   INFILE 'C:\Users\SSMS1302-03\Desktop\Lab6\Games.dat';
   INPUT Month 1 Day 3-4 Team $ 6-25 Hits 27-28 Runs 30-31;
   RunsTodate + Runs; /*missing line*/ *SUM statement;
RUN;
PROC PRINT;
TITLE "Season's Record - Total Run";
RUN;


*Total Runs - SUM function together with Retain Statement;

DATA game_total_2;
   INFILE 'C:\Users\SSMS1302-03\Desktop\Lab6\Games.dat';
   INPUT Month 1 Day 3-4 Team $ 6-25 Hits 27-28 Runs 30-31;
   RunsToDate = sum(RunsToDate, runs); /*missing line*/  *SUM statement*;
   retain; /*missing line*/ *must add a retain here; 
RUN;
PROC PRINT;
TITLE "Season's Record - Total Run(Sum Functon)";
RUN;
title;

/*SAS Automatic Variables*/
/*  _N_  indicates the number of times SAS has looped through the DATA step*/

DATA walkers;   
INFILE 'C:\Users\SSMS1302-03\Desktop\Lab6\Walk.dat';   
INPUT Entry AgeGroup $ Time @@; 
Place = _N_;
Label place = 'Number of Iterations';
RUN;

Proc print data=walkers label;
run;


/* First. and Last. are available 
when you use a BY statement in the data step*/
* SORT data by AgeGroup first;
proc sort data=walkers out=walkers_sorted;
	BY Agegroup;
run;
proc print;
run;


*Keep the first obs in each age group;
Data Winners (drop=place);
set walkers_sorted;
by AgeGroup;
if first.AgeGroup=1;
run;
proc print; 
title 'Winners in each age group';
run;



*Calculate the total time for each age group;
Data Walkers_total (keep=AgeGroup Total_time);
	set Walkers_sorted;
	by Agegroup;
	if first.AgeGroup then TotaL_time = 0;
	Total_time +time;
	if last.AgeGroup;
	run;
Title 'total running time for each age group';
proc print;
run;


/*Do while vs Do until*/
Data Squared_while;
do while (y<=20);
x+1;
y=x**2;
output;
end;
run;

proc print; run;


Data squared_until;
do until (y>=20);
x+1;
y=x**2;
output;
end;
run;

proc print; run;




/*Colon Modifier - 
Use informats with list input, Read Non-standard Data values*/

/*DLM - define delimiter other than blank(default)*/

/*DSD - consecutive delimier = missing value  
& embed delimier for values inside quotes*/

/*MISSOVER - tell SAS if it runs out of data,
 don't go to the next dataline to continue reading*/

DATA music;
   INFILE 'C:\Users\SSMS1302-03\Desktop\Lab6\Bands.csv' DLM = ',' DSD MISSOVER;
   INPUT BandName :$30. GigDate :MMDDYY10. EightPM NinePM TenPM ElevenPM;
RUN;
PROC PRINT; 
RUN;



*Exercise: ; 

/*Using RETAIN and SUM statements to find total Hits*/
DATA game_total_2;
   INFILE 'C:\Users\SSMS1302-03\Desktop\Lab6\Games.dat';
   INPUT Month 1 Day 3-4 Team $ 6-25 Hits 27-28 Runs 30-31;
   RunsToDate + Runs; /*missing line*/  *SUM statement*;
   retain; /*missing line*/ *must add a retain here; 
RUN;
PROC PRINT;
TITLE "Season's Record - Total Hits";
RUN;
