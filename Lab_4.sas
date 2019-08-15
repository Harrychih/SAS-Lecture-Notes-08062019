/*Lab 4*/

/*Append Datasets using set statement*/

DATA SOUTH;
INPUT	Entrance $ PassNumber Partysize Age;
DATALINES;
S 43 3 27
S 44 3 24
S 45 3 2
;
RUN;

DATA NORTH;
INPUT	Entrance $ PassNumber Partysize Age;
DATALINES;
N 21 5 41
N 87 4 33
N 65 2 67
N 66 2 7
;
RUN;

/*Basic Appending*/
Data Both_1;
Set South North;
run;
proc print;
run;

/*Exchange the order of the 2 datasets*/
 Data Both_2;
 Set North South;
 run;
 proc print;
 run;
 
/*Append Sorted Data*/
/*Sort both south and north by PassNumber*/
proc sort data=south out=south2;
by PassNumber;
run;

proc sort data=north out=north2;
by Passnumber;
run;




/*Append the 2 datasets and sort them based on passnumber*/
Data Both_3;
Set South2 North2;
by Passnumber;
run;
proc print;
run;


/*Different attributes for the same variable in 2 datasets*/
DATA Store1;
INPUT Store  1 Day $ 3 Sales 5-8; 
FORMAT Sales COMMA5.;
LABEL Sales = 'TOTAL SALES';
DATALINES;
1 M 1200
1 T 1435
1 W 1720
;
RUN;

DATA Store2;
INPUT Store 1 Day $ 3 Sales 5-8; 
FORMAT Sales DOLLAR6.;
LABEL Sales = 'Sales For The Day';
DATALINES;
2 M 2200
2 T 1692
2 W 2105
;
RUN;

/*Will use the attributes of the first dataset*/
Data Both_4;
Set Store1 Store2;
Run;
proc print data=Both_4 label;
run;

Data Both_5;
Set Store2 Store1;
run;
Proc print data=Both_5 label;
run;

/* MERGE */

DATA descriptions;     
INFILE 'C:\Users\PHELPS1526-08\Desktop\Lab_4-2\Chocolate.dat' TRUNCOVER;    
INPUT CodeNum $ 1-4 Name $ 6-14 Description $ 15-60; 
RUN;
PROC PRINT;
RUN;

DATA sales;    
INFILE 'C:\Users\PHELPS1526-08\Desktop\Lab_4-2\Chocsales.dat';    
INPUT CodeNum $ 1-4 PiecesSold 6-7; 
RUN;
PROC PRINT;
RUN;

/*One-to-One Merge*/
/*Omit the by statement, the datasets are not linked*/

Data Chocolate;
Merge Descriptions Sales;
run;
Proc Print;
run;

/*Use by statement to link the 2 datasets*/
Proc Sort data=Desciptions out = descriptions2;
By CodeNum;
Run;

Proc Sort data=sales out=sales2;
By CodeNum;
run;

Data Chocolates2;
Merge descriptions2 Sales2;
by CodeNum;
run;

Proc print;
run;



/*Use IN to keep the matched record*/
Data chocolates3;
Merge description2 (in=A) Sales2 (in=B);
By CodeNum;
if A=1 AND B=1;
Run;

Proc Print;
run;


* Exercise ; 

/*sort datasets description and slales by Name*/ 
Proc sort data=description out=descrip;
by Name;
run;
Proc sort data=sales out=sale;
by Name;
run;


/*merge descriptions and sales by Name*/
Data Choco;
Merge descrip sale;
by Name;
run;


