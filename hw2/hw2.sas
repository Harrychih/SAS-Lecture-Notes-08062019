*1;
libname data1 'C:\Users\SSMS1301-19\Desktop\data1';
run;
proc sort data=data1.stresstest2 out=work.stresstest;
	by Name;
run;
proc sort data=work.stresstest;
	by Tolerance;
run;
proc print data=work.stresstest label;
	var Name RestHR RecHR Date;
	by Tolerance;
	pageby Tolerance;
	id Tolerance;
	format Date DATE9.;
	title 'Patient List';
	label Tolerance = 'Tolerance Level'
		  RestHR = 'Resting Heart Rate'
		  RecHR = 'Recovery Heart Rate'
		  Date = 'Date of Visit';
run;

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
options nodate 
proc print data=work.sanfran no;
