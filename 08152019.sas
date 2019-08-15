libname data1 'C:\Users\SSMS1301-20\Desktop\data1';

proc contents data=data1.heart;run;

proc print data=data1.heart;run;

proc sort data=data1.heart out=heart;
by sex;
run;

proc means data=heart;
var arterial cardiac;
class sex;
run;

proc freq data=data1.heart;
tables shock survive;
run;

proc report data=data1.heart;
run;

data admit;
set data1.admit;
label actlevel = 'Activity Level';
run;

proc report data=admit;
column age name;
run;

proc print data=data1.admit;
var age name;
run;

proc report data=data1.crew;
	column Jobcode Location Salary;
	define Jobcode / order width=8 'Job Code';
	define location / 'Home Base';
	define Salary / format=dollar10.;
run;

proc gchart data=data1.crew;
pie JobCode / sumvar=Salary
type=sum
explode = 'PILOT3';
format Salary dollar8.;
run;

proc tabulate data=data1.employees;
where country in ('USA','DENMARK','GERMANY') and division in (' AIRPORT OPERATIONS',' HUMAN RESOURCES');
class division country;
var salary;
tables division all, country*salary*mean all*salary*mean;
run;

proc report data=data1.employees split=' ';
column country lastname salary;
define country / order;
define lastname / 'Last Name';
define salary / format=dollar10.;
run;

proc format;
Value sexfmt 1='Female'
			 2='Male';
run;
 
proc report data=data1.heart headline;
column survive sex arterial;
define survive / group 'survived' width=8;
define sex / group 'Gender' format=sexfmt.;
define arterial / mean 'Mean Arterial Pressure' width=8 format 5.2;
break after survive / summarize dol ul;
rbreak after / summarize;
	
