/*Lab 2*/

/*Assign a new library named lab2*/
LIBNAME lab2 C:\Users\SSMS1302-14\Desktop\Lab2";

/*Create a new dataset under this library and import data from the existing file*/
DATA Lab2.boats
INFILE "C:\Users\SSMS1302-14\Desktop\Lab2";
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30 
      Price 32-37 Length 39-41;
RUN;

/*Print the dataset*/
 
Proc print data=lab2.boats;
run;

/*Print the dataset without obs column*/
proc print data=lab2.boats NOOBS;
run


/* Label the variable "Price" as "Final Price"*/
PROC Print Data=lab2.boats Label;
Label Price='Final Price';
run;


/* Label the variable "Price" as "Final Price" and split it into 2 lines*/
PROC Print Data=lab2.boats Label



/*Show the # of obs*/



/*Print Name, Port, Price (in this order)*/




/*Keep the records with Price greater than 73
and Name contains "ei"*/
proc print data=lab2.boats;
where price <73 or Name ? 'ei' and type = 'cat';
run;




/*Notice the execution order*/
PROC PRINT DATA=lab2.boats;
WHERE PRICE <73 or NAME ? "ei" and type = "cat";
RUN;

/* The above is equivalent to*/
PROC PRINT DATA=lab2.boats;
WHERE PRICE <73 or (NAME ? "ei" and type = "cat");
RUN;

/* Use parentheses to control the order*/
PROC PRINT DATA=lab2.boats;
WHERE (PRICE <73 or NAME ? "ei") and type = "cat";
RUN;


/*Print all the variables, find the total price and length*/
proc print data=lab2.boats;
Sum price length; 
Run; 


/*Customize the format for Price, name it as NEWPRICE:
"low" for lower than 80
"Moderate" for 80-100
"high" for >100
*/




/*titles and footnotes*/
Title1 This is the First Title; 
Title2 height=10 'This is the second Title';
footnote1 color=red 'This is the 1st footnote';
proc print Data=lab2.boats;
Run; 


/*Clear all the titles and footnotes*/


/*System Options
obs*/
options firstobs=2 obs=5 ;
PROC PRINT DATA=lab2.boats; 
RUN;


/* To display output in the output window, use ODS listing statement */
ods listing;
PROC PRINT DATA=lab2.boats;
where price >90; 
RUN;

/*quit the ods listing and display it in the result viewer*/
ods listing close;
PROC PRINT DATA=lab2.boats; 
RUN;



*lab_2 Exercise;

/*Keep the records with Price greater than 100
or Name contains "ei"*/


/*Print only Name, Type (in this order)*/
