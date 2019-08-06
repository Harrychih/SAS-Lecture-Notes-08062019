libname data1 'C:\Users\SSMS1302-17\Desktop\data1';

proc print data=data1.stresstest noobs;
var Name MaxHR RestHR;
*where maxhr >= 170;
run;

proc print data=data1.empdata;
/*where jobcode='fltat';
**Incorrect because string comparison here*/;
where jobcode EQ 'FLTAT' & Salary>50000;
*where jobCode ^ in(not in) ('PILOT','FLTAT');
run;

proc print data=data1.empdata label;*spilit=' ';
label LastName='Last Name'
	  FirstName='First Name'
	  Salary='Annual Salary';
sum salary;
run;

proc print data=data1.empdata n='Numbers of Employees: ';
run;

data Stocks;
input Ticker$ Open Close Volume;
datalines;
BAC 29.95 29.58 68.19
FB 174.25 176.07 28.34
GOOG 1028.10 1024.38 1.35
HABT 10.20 10.25 0.64
TSLA 298.57 301.15 8.82
TWTR 30.00 30.55 22.48
;
run;

proc print;
run;

PROC PRINT data=data1.credit nooobs;
var name transaction;
label name='Client Name'
	  transaction='Transaction Amount';
sum transaction;
run;
