libname data1 'C:\Users\SSMS1301-19\Desktop\data1';

proc sgplot data=data1.admit;
scatter x=weight y=height;
run;
quit;

proc sgplot data=data1.flight114;
*this selects one week of flights;
where date between '02mar2001'd and '08mar2001'd;
scatter x=Boarded y=Date;
symbol value=square i=join;
run;

ods html file='Salary.html'  style=Analysis;
proc print data=data1.empdata label noobs;
label Salary='Annual Salary';
title1 'Salary Report';
run;
ods html close;

ods html file='Admit.xls';
title;
proc print data=data1.admit noobs;
run;
ods html close;

ods csvall file='admit.csv';
title;
proc print data=data1.admit noobs ;
run;
ods csvall close;

ods html file='vbar.html';
goptions dev=activex;
proc gchart data=data1.crew;
vbar JobCode;
run;
ods html close;
goptions reset=all;


ods html file='C:\Users\SSMS1301-19\Desktop\pilots.html'  style=Analysis;
proc contents data=data1.pilots;
run;
proc print data=data1.pilots ;
title1 'Pilots Information';
run;
ods html close;


data work.pilots;
set data1.pilots;
age=floor('01JAN1982'd-birth)/365);
run;
ods listing;
proc gchart data=data1.pilots;
vbar jobcode;
run;
proc gplot data-data1.pilots;
symbol v-square c=blue;
label salary='Annual Salary'
	  age='Age';
plot  Age
