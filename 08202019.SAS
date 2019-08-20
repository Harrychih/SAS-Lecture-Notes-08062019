libname data1 'C:\Users\SSMS1301-19\Desktop\data1';

proc print data=data1.admit;
run;
data weightproj;
	set data1.admit;
	year=1; 
	Projweight=1.05*weight; 
	output;
    year=2;
	Projweight=Projweight*1.05;
	output;
    year=3;
	Projweight=Projweight*1.05;
	output;
	year=4;
	Projweight=Projweight*1.05;
	output;
	year=5;
	Projweight=Projweight*1.05;
	output;
run;

proc print data=weightproj noobs label;
var name year projweight;
run;

data low(keep=name age) 
	 mod(keep=name date) 
     high(keep=name fee);
set data1.admit;
if actlevel='LOW' then output low;
else if actlevel='MOD' then output mod;
else if actlevel='HIGH' then output high;
run;
proc print data=high;run;

data work.visits;
input name $1-4 visit mmddyy8. weight 15-17;
format visit mmddyy8.;
datalines;
john 01/01/08 210
john 04/04/08 199
john 07/03/08 183
mary 02/14/08 175
mary 05/16/08 167
mary 08/04/08 153
dave 09/23/08 223
dave 12/28/08 215
dave 03/24/09 206
;
run;

proc print data=visits;
run;

data weightloss;
	set visits;
	weightchange = lastweight-weight;
	lastweight=weight;
	retain;
	run;
proc print;run;

proc sort data=visits out=visits_sorted;
by name;
run;
proc print data=visits_sorted;
run;

data weightloss;
set visits_sorted;
by name;
if first.name then baseweight=weight;
weightchange=baseweight-weight;
if last.name then output;
retain;
run;
proc print;run;

libname data2 'C:\Users\SSMS1301-19\Desktop\data2';
data MthTot1;
set data2.daysales;
if _n_=1 then Mth2Dte = 0;
Mth2Dte = Mth2Dte + SaleAmt;
retain;
run;
data MthTot2;
set data2.daysales;
Mth2Dte = sum(Mth2Dte,SaleAmt);
retain;
run;
proc print;run;

proc sort data=data2.regsals out=divsort;
by Div;
run;
data divsalaries(keep=Div DivSal);
set divsort;
by Div;
if First.Div then DivSal=0;
DivSal+Salary;
if Last.Div;
run;
proc print;
run;

data army(keep=Code Airport);
set data2.military(drop=City State Country);
if Type eq 'Army' then output;
run;
proc print;run;	
