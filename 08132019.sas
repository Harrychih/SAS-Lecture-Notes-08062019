libname dataL7 'C:\Users\SSMS1301-19\Desktop\Data L7';
run;
data PSTAT130;
infile 'C:\Users\SSMS1301-19\Desktop\Data L7\PSTAT130.txt';
input StudentNames $1-16;
CourseName = 'PSTAT130';
run;

data PSYCH118;
infile 'C:\Users\SSMS1301-19\Desktop\Data L7\PSYCH118.txt';
input StudentNames $1-16;
CourseName = 'PSYCH118';
run;

data POLI125;
infile 'C:\Users\SSMS1301-19\Desktop\Data L7\POLI125.txt';
input StudentNames $1-16;
CourseName = 'POLI125';
run;

data studentName;
merge PSTAT130 PSYCH118 POLI125;
run;

proc print data=studentName;
run;

data Instructors;
infile 'C:\Users\SSMS1301-19\Desktop\Data L7\instructors.txt';
input InstructorName $1-13 
	  AcademicRank $16-20 
	  @23 Salary dollar7.0 
	  CourseName $32-39 
	  @42 FirstClassDate mmddyy8.;
run;
proc print;
run;

data Classroom;
infile 'C:\Users\SSMS1301-19\Desktop\Data L7\classrooms.txt';
input @1 BldgName $11. 
	  @14 RoomNumber$16. 
	  @19 CourseName $26. 
	  @29 Days $33. 
	  @36 Time $43.;
run;
proc print;
run;

data Allstudents;
	set PSTAT130 PSYCH118 POLI125;
run;
proc print data=Allstudents;
run;
