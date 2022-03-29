Create table #Temporary_tab2
(Id int not null,

first_name char(215),
anul int,
Luna int,
Mon varchar(210),
Short char(25),
Dai int,
Country varchar(200),
Last_Name varchar(250),
Primary Key (Id)
)

Create table #Temporary_tab1
(Id int not null,
Prefix char (210),
first_name char(215),
Middle_Initial varchar,
Last_Name varchar(250),
Gender char(23),
E_Mail varchar(250),
greutate int,
Salary int,
Country varchar(200),
City varchar(250),
State_s char(23),
Zip int,
Region varchar(250), 
Nick_name varchar(250)
Primary Key (Id)
)


SET IDENTITY_INSERT production.categories ON;
BULK INSERT #Temporary_Tab1
FROM 'C:\Users\etabac\Downloads\1000-Records\1000 Records.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR='\n' );

	
SET IDENTITY_INSERT production.categories ON;
BULK INSERT #Temporary_Tab2
FROM 'C:\Users\etabac\Downloads\1000-Records\Table1.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR='\n' );


	Select * from #Temporary_tab1
	Select * from #Temporary_tab2

	Select #a.Id, #a.first_name, #a.Country, #b.last_name, #b.City, #b.Nick_name, #b.Zip, Max(#b.Salary)
	from 
	#Temporary_Tab2 #a join 
	#Temporary_tab1 #b 
	on
	#a.first_name = #b.first_name 
	
	where Gender in (Select Gender from #Temporary_tab1 where Region  like 'Mid%')
	group by #a.Id, #a.first_name, #a.Country, #b.last_name, #b.City, #b.Nick_name, #b.Zip
	order by #a.first_name desc

Drop table #Temporary_Tab2
Drop table #Temporary_Tab1

