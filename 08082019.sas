libname data1 'C:\Users\SSMS1301-18\Desktop\data1';

proc contents data=data1._all_ nods;
run;

proc print data=data1.admit;
run;

proc sort data=data1.admit out=temp_admit;
by actlevel sex;
run;

proc print data=temp_admit;
var actlevel sex name;
run;

proc contents data=data1.staff;
run;

proc print data=data1.staff;
run;

proc sort data=data1.admit out=temp_admit;
by sex;
run;

proc print data=temp_admit;
var actlevel sex name;
run;

proc sort data=data1.admit
out=work.admit;
by ActLevel;
run;
proc print data=work.admit;
by ActLevel;
sum Fee;
run;

proc print data=work.admit;
by ActLevel;
pageby ActLevel;
sum Fee;
run;

Proc sort data=data1.admit out=temp_admit;
by sex name;
run;

options firstobs=1 obs=15;
title 'Admittance Report';

proc print data=temp_admit noobs n;
by sex;
pageby sex;
sum fee;
run;

proc print data=data1.empdata;
id JobCode;
var EmpID Salary;
run;
proc sort data=data1.empdata out=work.empdata;
by JobCode;
run;

proc print data=work.empdata;
by JobCode;
id JobCode;
sum Salary;
run;

data work.temp_empdata;
set data1.empdata;
run;

data work.dfwlax;
set data1.dfwlax;
run;

libname mydrive 'D:\';
data mydrive.dfwlax;
set data1.dfwlax;
run;

data temp_staff;
	set data1.staff;
run;

proc sort data=temp_staff;
by WageCategory Name;
run;

options nodate nonumber;

proc print data=temp_staff;
by WageCategory;
pageby WageCategory;
id WageCategory;
var WageCategory Name WageRate Bonus;
title 'Salary Information';
run;
