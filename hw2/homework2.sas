*1;
libname data1 'C:\Users\SSMS1301-19\Desktop\data1';
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
	infile 'C:\Users\SSMS1301-19\Desktop\data1\SFOSCH.dat';
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
	infile 'C:\Users\SSMS1301-19\Desktop\data1\SFOSCH.dat';
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
 	will cause malposition of data or missing of data which is why we are missing
	these values in the table.
*/
*C);
options date number pageno=2 linesize=90;
proc print data=work.passengers;
format depart MMDDYY8.;
run;

*4;
*a);
proc print data=work.passengers label;
	label FClassPass = 'First Class'
		  BClassPass = 'Business Class'
		  EClassPass = 'Economy Class';
Run;

proc contents data=work.passengers;
run;

*b);
proc datasets library=work;
	modify passengers;
	label Depart = 'Departure Date';
	format Depart Date7.;
run;

proc contents data=work.passengers;
run;


*5;
*a);
title;
data work.AnnualBonus1;
	set data1.crew;
	Bonus = 0.08 * Salary;
	AnnivMo = month(HireDate);
run;
proc print data=work.AnnualBonus;
run;

data work.AnnualBonus;
	set work.AnnualBonus1(Keep=AnnivMo LastName Bonus);
run;
proc datasets library=work;
	modify AnnualBonus;
	label AnnivMo = 'AnnualBonus';
run;
proc print data=work.AnnualBonus;
run;
*b);
proc print data=work.AnnualBonus;
format Bonus comma5.2 dollar5.2;
title 'The Annual Bonus of crews';
run;
