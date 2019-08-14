*1;
libname data1 'C:\Users\SSMS1303-19\Desktop\data1';
run;
proc sort data=data1.stresstest2 out=work.stresstest;
	by descending Tolerance Name;
run;
proc print data=work.stresstest label split=' ';
	var Name RestHR RecHR Date;
	by descending Tolerance;
	pageby Tolerance;
	id Tolerance;
	format Date DATE9.;
	title 'Patient List';
	label Tolerance = 'Tolerance Level'
		  RestHR = 'Resting Heart Rate'
		  RecHR = 'Recovery Heart Rate'
		  Date = 'Date of Visit';
run;
/*(c)
The blank space in the column Tolerance means there is missing Tolerance Level Eberhardt.
The periods in the columns RestHR and RecHR also represent missing value for each variables.
*/

*2;
title;
data work.sanfran;
	infile 'C:\Users\SSMS1303-19\Desktop\data1\SFOSCH.dat';
	input FightID $ RouteID $ Destination $ Depart $ TotPassCap;
run;
proc print;
run;
/*2(b)
Fight ID is a Character Type*/
/*2(c)
52 records were from the raw file.
52 observations contained.
5 variables contained.
*/
proc contents data=work.sanfran;
run;

Options nodate nonumber linesize=75; 
proc print data=work.sanfran;
title c=red  'San Francisco Fight Data';
/*(e)
(i)the color of the title in the Output window is blue;
(ii)the color of the title in the Results Viewer window is red*/


*3;
*(A);
data work.passengers;
	infile 'C:\Users\SSMS1303-19\Desktop\data1\SFOSCH.dat';
	input @1 FightID $ 
		  @8 RouteID $
		  @18 Destination $
		  @41 Depart DATE9.
		  @54 FClassPass
		  @57 BClassPass
		  @61 EClassPass;
run; 
proc print;
run;
/*B)
i. 52 records were read from the raw data file.
ii. 52 observaions are in the resulting SAS data set.
iii. 7 variables are in the resulting SAS data set.
iv. Error: Invalid data for BClassPass in line 11 57-59 and line 26 57-59. It
 	will cause malposition of data. 
*/
options date number pageno=2 linesize=90;
proc print data=work.passengers;
format depart MMDDYY8.;



