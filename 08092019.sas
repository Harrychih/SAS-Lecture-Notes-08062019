data students;
input Name $ Gender $ Age Enroll mmddyy8.;
datalines;
David Male 19 06/18/10
Amelia Female 23 08/02/10
Ravi Male 17 07/22/10
Ashley Female . 09/14/10
Jim Male 26 08/26/10
;
run;

proc print data=work.students;
run;

data census1;
input state $ pop;
datalines;
California 36.9
Texas 24.8
NewYork 19.5
Florida 18.5
Illinois 12.9
;
run;
proc print data=census1;run;

data census2;
input state $1-10 pop 13-16;
datalines;
California 36.9
Texas 	   24.8
New York   19.5
Florida    18.5
Illinois   12.9
;
run;
proc print data=census2;run;

data people;
input name $12. +(-1) age;
datalines;
john smith 25
jane doe 29
;
run;
proc print data=people;
run; 

data ucsb_alumni;
input name $ 1-15 #2 age 13-14 #3;
datalines;
Leroy Chiao
male 55
astronaut
Benjamin Bratt
male 52
actor
;
run;
proc print data=ucsb_alumni;
run;

PROC IMPORT DATAFILE='C:\Users\SSMS1301-14\Desktop\data1\DallasLA.xls'
OUT=WORK.tdfwlax
DBMS=XLS REPLACE;
SHEET='DFWLAX';
GETNAMES=YES;
RUN;
libname data1 'C:\Users\SSMS1301-14\Desktop\data1';
run;

DATA work.bonus;
set data1.empdata;
Bonus = Salary * .1;
label Bonus = 'Annual Bonus';
format Bonus Dollar12.2;
RUN;
proc contents data=bonus;run;

proc print data=bonus label;
run;

PROC PRINT data=work.bonus label;
label Bonus = 'Incentive Bonus';
format Bonus Dollar12.;
run;

proc contents data=bonus;run;

proc print data=data1.insure;
run;

data work.insure1;
set data1.insure(drop=id total);
run;
proc print;run;

data work.insure2;
set data1.insure;
drop policy balancedue;
run;
proc print;run;

data work.insure3;
set data1.insure;
keep Name balancedue;
run;
proc print;run;

data work.insure4;
set data1.insure(keep=id balancedue);
run;
proc print;run;

data insure;
set data1.insure;
label name='Full Name'
	  policy='Policy Number'
	  pctinsured='Percent Insured'
	  total='Total Amount'
	  balancedue='Balance Due';
format total dollar9.2;
run;
proc contents data=insure; run;
proc print data=insure label; 
label name='Given Name'
	  pctinsured='Insured Percentage';
run;

proc datasets library=work;
modify insure;
label name='Given Name'
	  pctinsured='Insured Percentage';
run;
proc contents data=insure;run;
