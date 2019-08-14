libname data1 'C:\Users\SSMS1301-19\Desktop\data1';
proc sort data=data1.admit out=admit;
by ActLevel;
run;

proc means data=admit n mean stddev;
var age height weight;
by ActLevel;
run;

proc contents data=data1.admit;
run;

proc means data=data1.admit n mean stddev maxdec=2;
title 'PROC MEANS with a CLASS variable';
var age height weight;
class actlevel;
output out=meansout;
run;

title;
proc freq data=data1.admit;
run;

proc freq data=data1.crew;
table jobcode;
run;

proc format;
value $codefmt 'FLTAT1'-'FLTAT3' = 'Fight Attendent'
			   'PILOT1'-'PILOT3' = 'Pilot';
value money low-<25000 ='Less than 25,000'
			25000-50000='25,000 to 50,000'
			50000<-high='More than 50,000';
run;

proc freq data=data1.crew;
tables JobCode*Salary;
format JobCode $codefmt. 
	   Salary money.;
title 'Salary Distribution by Job Codes';
run;
title;
title2 'by JobCode';
proc tabulate
data=data1.fltat;	
class Location JobCode;
table JobCode, Location;
run;

title 'Counts for Cary and Frankfurt';
proc tabulate data=data1.fltat;
where Location in ('CARY', 'FRANKFURT');
class Location JobCode;
table JobCode, Location;
run;

proc tabulate data=data1.fltat format=dollar12.;
where Location in ('CARY', 'FRANKFURT');
class Location JobCode;
var Salary;
table JobCode*Salary*mean, Location;
run;



data fltat;
set data1.fltat;
format salary dollar12.;
run;

proc contents data=fltat;
run;
proc print data=fltat;run;
proc tabulate data=fltat;
class jobcode location;
var salary;
table jobcode, location*salary;
run;
