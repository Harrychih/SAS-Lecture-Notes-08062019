/* Programming Assignment;
Name: Yanjie Qi
Perm#: 5382452
Section: Tianzi Chen 1302(T R)
1.*/

libname data1 'C:\ Desktop\data1';

* 2.;

PROC PRINT data=data1.talent4;
run;
proc format;
value $Agencyfmt 'GEORGE STICKS','GOLDEN GUILD'='AEA'
				 'ALL STARS','STARS AND STRIPES'='AFT'
				 other=none;

proc print data=data1.talent4 label;
title1 'Casting Call' c=green;
title2 'Candidates' c=black h=2;
footnote 'Last Edited: 8/8/2019';
Var LastName FirstName Agency;
label LastName='Last Name'
	  FirstName='First Name'
	  Agency='Union';
where Height > 66;
format Agency $Agencyfmt.;
 
* 3.;

data members;
input first$ last$ mem_id$ mem_months gen$;
datalines;
Kyle Cooper B13852 28 m
Sierra Hurst B15935 19 f
Brad Louie B10583 42 m
Chrissy Moore B19481 5 f
James Chen B10537 46 m
Jill Vern B16471 16 f
Roger Shah B10434 50 m
Anna Pine B18221 7 f
Noah Lind B12584 33 m
Dan Baker B13586 30 m
;
run;

proc print data=members;
run;

options pageno=10 nodate;
proc print data=members noobs label n;

var mem_id mem_months first gen;
Label mem_id = 'Membership ID'
	  mem_months='Membership Months'
	  first='First Name'
	  gen='Gender';
where mem_id?'8' and mem_months<=40;
run;
 
/*Note: Screenshot of the result viewer is in another file
I do not understand why in the SSMS machines, 
its titles could not be displayed normally; 
instead, the first program had the title I set for the second. 
I am pretty sure My code is right. 
Please run in the local computer to see the exact correct output!*/


