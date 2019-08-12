libname data1 'C:\Users\SSMS1301-14\Desktop\data1';

data work.admit;
set data1.admit;
Height_ft=Height/12;
run;
title 'Patient Information';
proc print data=admit noobs;
var Name Age Height Height_ft;
run;

data temp;
evaldate='1jan2019'd;
run;
proc print;
*format evaldate mmddyy8.;
run;

data temp;
evaldate1='24jun2000'd;
evaldate2=mdy(6,24,2000);
run;
proc print;
run;

data work.admit2;
set data1.admit;
if age < 50 and age >= 30;
run;
proc print data=work.admit2;
run;
