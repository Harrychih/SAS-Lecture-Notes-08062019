libname data2 'C:\Users\SSMS1301-14\Desktop\data2';

data silverff;
	set data2.ffhistory;
	silver=0;
	level1=scan(status,1,',');
	level2=scan(status,2,',');
	level3=scan(status,3,',');
	if lowcase(scan(level1,1))='silver' then do;
		silver=1;
		year=scan(level1,2);
	end;
	else if lowcase(scan(level2,1))='silver' thern do;
		silver=1;
		year=scan(level2,2);
	end;
		else if lowcase(scan(level3,1))='silver' thern do;
		silver=1;
		year=scan(level3,2);
	end;
run;
proc print;var id status year; run;

data bonuses;
	set data2.salary1;
	Bonus=.1*GrossPay;
	run;
proc print;run;

proc contents data=bonuses;
run;

data bonuses2;
set data2.salary2;
Bonus=.1*input(GrossPay,comma6.);
run;
proc print;run;
