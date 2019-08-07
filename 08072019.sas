libname data1 'C:\Users\SSMS1302-14\Desktop\data1';

proc print data=data1.empdata split=' ';
	format salary dollar11.2;
run;

data datetest;
input days;
date=days;
datalines;
0
1
59
365
366
21101
;
run;
proc print;
format date mmddyy10.;
run;

proc format;
value $codefmt 'FLTAT'='Flight Attendant'
			   'PILOT'='Pilot';

value money		low-<25000='Less than 12,000'
				25000-50000='25,000 to 50,000'
				50000-high='More than 50,000';
run;

proc print data=data1.empdata split=' ';
label LastName='Last Name'
	  FirstName='First Name'
	  Salary='Annual Salary';
format salary money.
	   Jobcode $codefmt.;
run;

proc print data=data1.navigators;
run;

proc format;
value $stateFmt 'CT'='Connecticut'
				'NJ'='New Jersy'
				'NY','YN'='New York';
value $jcfmt 'NA1'='Navigator 1'
			 'NA2'='Navigator 2';
value salaryfmt low-9999='Below 10k'
				10000-50000='Between 10k and 50k'
				50000-high='More than 50k';
run;

proc print data=data1.navigators;
format state $stateFmt.
	   jobcode $jcfmt.
	   salary salaryfmt.;
run;

proc print data=data1.staff;
run;

proc format;
value $wcfmt 'S'='Salary'
			 'H'='Hourly';
value bonusfmt low-<800='Low'
			   800-1200='Moderate'
			   1200-high='High';
run;

proc print data=data1.staff;
format wagecategory $wcfmt.
	   bonus bonusfmt.;
run;
