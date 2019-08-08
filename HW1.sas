libname data1 'C:\Users\SSMS1301-18\Desktop\data1';

PROC PRINT data=data1.talent4;
run;

proc format;
value $Agencyfmt 'GEORGE STICKS','GOLDEN GUILD'='AEA'
				 'ALL STARS','STARS AND STRIPES'='AFT'
				 other=none;

proc print data=data1.talent4;
title1 'Casting Call' c=green;
title2 'Candidates' c=black h=2;
footnote 'Last Edited: 8/8/2019';
Var LastName FirstName Agency;
label LastName='Last Name'
	  FirstName='First Name'
	  Agency='Union';
where Height > 66;
format Agency $Agencyfmt.;
