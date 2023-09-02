--By Mostafa Ayman 18105341
--BY Shady Hisham  18104105

create database Gym_project
use Gym_project

--Member table 
create table Member (
mid int primary key ,
mfname varchar(15) not null,
mlname varchar(15) not null ,
mssn char(14) unique not null ,
age int not null ,
gender char not null check (gender='M' or gender='m' or gender='F' or gender='f'),
m_email varchar(30) ,
address varchar(35) ,
weight numeric (4,1) not null , --  ex 50.4 or 100.5
height numeric (3,2) not null , -- ex 1.74 meter
joining_date date not null ,
msid int 
);

--Trainer table 
create table Trainer(	
tid int primary key ,
tfname varchar(15) not null,
tlname varchar(15) not null ,
tssn char(14) unique not null ,
t_age int not null check ( t_age >=20 and t_age <=55),
t_gender char not null check (t_gender='M' or t_gender='m' or t_gender='F' or t_gender='f'),
t_email varchar(30) ,
t_address varchar(35) ,
t_employement_date date not null ,
t_salary money not null,
rid int check ( rid=1 or rid=2)
);

--Employee table
 create table Employee ( 
eid int primary key ,
efname varchar(15) not null,
elname varchar(15) not null ,
essn char(14) unique not null ,
e_age int not null check( e_age >=21 and e_age <=65),
e_gender char not null check (e_gender='M' or e_gender='m' or e_gender='F' or e_gender='f'),
e_email varchar(30) ,
e_address varchar(35) ,
e_employement_date date not null ,
e_salary money not null,
rid int , check ( rid in (3,4,5,6)),
manager_id int 
);

--Workout_Plan table
create table Workout_Plan (
wpid int primary key ,
wpname varchar(20) not null ,
wp_description varchar(100) not null , 
wp_duration varchar(8)not null 
);

--Machine table 
create table Machine ( 
mcid int primary key,
mc_name varchar(13) not null ,
mc_description varchar(90) not null ,
maintenance_date date not null 
);

--Membership table
create table Membership (
msid int primary key ,
ms_duration varchar(8) not null ,
ms_price money not null ,
number_of_invitations int
);

--Product table
create table Product(
pid int primary key ,
pname varchar(15) not null ,
p_price money not null ,
p_description varchar(50) not null
);

--Role table 
create table Role ( 
rid int primary key ,
rname varchar(15) not null unique 
);

--employee phone table 
 create table Employee_phone (
e_phone char(11) , 
eid int ,          
primary key (eid,e_phone)
);

--Trainer phone table 
create table Trainer_phone (
t_phone char(11) , 
tid int ,           
primary key (tid,t_phone)
);

--member phone table 
create table Member_phone (
m_phone char(11) , 
mid int ,            
primary key (mid,m_phone)
);

--Trainer Qualification table
create table Trainer_qualification (
tid int ,                 
Qualification varchar(40),
primary key ( tid,Qualification)
);

--Member product table 
create table Member_product (
Order_id int primary key ,
mid int not null,                   
pid int not null                 
);

--Member_workoutplan_Trainer Table 
create table Member_workoutplan_Trainer(
mid int  ,       
wpid int ,          
tid int ,                       
Starting_date date ,
bzz_date  date,
primary key ( mid,wpid,tid,Starting_date)
);

--Class Table 
Create table Class ( 
cid int unique ,
tid int ,          
cname varchar(10) unique ,
c_day varchar(9) not null,
c_time varchar(10) not null , -- ex 12:00 pm 
primary key (cid,tid)
);

--Member class table 
create table Member_class(
mid int , 
cid int , 
tid int , 
mem_class_Date date ,
primary key (mid,cid,tid,mem_class_Date)
);

--Adding member Table foreign keys 1
Alter table member add foreign key (msid) references Membership(msid);

--Adding trainer Table foreign keys 1  
Alter table Trainer add foreign key (rid) references Role(rid);

--Adding Employee Table foreign keys 2
Alter table Employee add foreign key (rid) references Role(rid);
Alter table Employee add foreign key (manager_id) references Employee(eid);

--Adding employee phone Table foreign keys 1
Alter table Employee_phone add foreign key (eid) references Employee(eid);

--Adding Trainer phone Table foreign keys 1
Alter table Trainer_phone add foreign key (tid) references Trainer(tid);

--Adding member phone Table foreign keys 1
Alter table Member_phone add foreign key (mid) references Member(mid);

--Adding Trainer Qualification Table foreign keys 1
Alter table Trainer_qualification add foreign key (tid) references Trainer(tid);

--Adding Member product Table foreign keys 2
Alter table Member_product add foreign key (mid) references Member(mid);
Alter table Member_product add foreign key (pid) references Product(pid);

--Adding Member_workoutplan_TrainerTable foreign keys 3
Alter table Member_workoutplan_Trainer add foreign key (mid) references Member(mid);
Alter table Member_workoutplan_Trainer add foreign key (wpid) references Workout_Plan(wpid);
Alter table Member_workoutplan_Trainer add foreign key (tid) references Trainer(tid);
--Adding Class Table foreign keys 1
Alter table Class add foreign key (tid) references Trainer(tid);

--Adding Member_class Table foreign keys 3
Alter table Member_class add foreign key (mid) references Member(mid);
Alter table Member_class add foreign key (cid,tid) references Class(cid,tid);


--Insertion in Membership table
insert into Membership values(1,'1 month',500,2),(2,'2 month',900,3),(3,'3 month',1100,5),(4,'4 month',1300,7),(5,'5 month',1500,8);
insert into Membership values(6,'6 month',1650,9),(7,'7 month',1700,10),(8,'8 month',1850,11),(9,'10 month',2100,14),(10,'1 year',2500,20);

--Insertion in Member table
insert into Member values(1,'Mostafa','Ayman',12345678901234,21,'M','mostafa-ayman@hotmail.com','Nasr city',71.5,1.74,'2020/4/3',10);
insert into Member values(2,'Shady','Hisham',12345678901235,22,'M','shady-Hisham@hotmail.com','Nasr city',79.5,1.84,'2020/4/3',10);
insert into Member values(3,'ahmed','safty',12345678901236,21,'M','ahmed-safty@hotmail.com','nozha city',70.5,1.76,'2020/7/8',6);
insert into Member values(4,'moahmed','Nabeel',12345678901237,21,'M','mohamed-nabeel@yahoo.com','new city',74.5,1.8,'2023/5/6',1);
insert into Member values(5,'Ayman','farouk',12345678901238,30,'M','ayman-farouk@outlook.com','abaseya',91.5,1.74,'2024/5/4',4);
insert into Member values(6,'salma','mahmoud',12345678901239,41,'F','salma-mahmoud@yahoo.com','Nasr city',61.5,1.54,'2015/4/3',3);
insert into Member values(7,'mahetab','roshdy',12345678901244,50,'F','mahetab-roshdy@hotmail.com','tagamo3 el 5',51.5,1.60,'2014/12/4',5);
insert into Member values(8,'pussi','amr',12345678901254,19,'F','pussi-amr@yahoo.com','maadi',72.5,1.84,'2022/11/3',2);
insert into Member values(9,'mahinar','Ali',12345678901274,21,'F','mahinar-ALi@outlook.com','rehab city',100.5,1.74,'2023/4/3',9);
insert into Member values(10,'Mostafa','hussein',12343678901234,21,'M','mostafa-hoss@yahoo.com','shrooq city',105.5,1.74,'2020/4/3',10)
select * from Member

--Insertion in Member phone table
insert into Member_phone values('01235718652',1),('01245718652',2),('01455718652',1),('01277718652',1),('01775718652',2);
insert into Member_phone values('01145617752',4),('01145719657',5),('01245718689',6),('01233718772',7),('01285777652',8);
insert into Member_phone values('01385777651',9),('0125776652',10),('01233718652',3),('01135718777',3),('01245718783',8);
insert into Member_phone values('01145719899',10),('01145717658',5),('01014918622',7),('01250318652',8),('01145718920',7);
select * from Member_phone

--Insertion in Role table
insert into Role values(1,'PersonalTrainer'),(2,'class Trainer'),(3,'Manager'),(4,'Receptionist'),(5,'sanit worker'),(6,'Bathroom worker');
select * from Role

--Insertion in Trainer table
insert into Trainer values(1,'mostafa','hassan','12345678954320',20,'M','mostafa-hassan@yahoo.com','nasr city','2020/12/2',3000,1);
insert into Trainer values(2,'mohamed','hassanen','12345678954321',25,'M','mohamed-hesso@yahoo.com','cairo city','2015/11/2',4000,1);
insert into Trainer values(3,'nadine','mohsen','12345678954322',30,'F','nadine-moho@gmail.com','maadi city','2018/10/2',4500,2);
insert into Trainer values(4,'nooran','hossam','12345678954324',30,'F','noooran-hoss@yahoo.com','tagamo3 ','2017/10/3',3500,2);
insert into Trainer values(5,'noreeem','said','12345678954325',35,'F','noraan-said@outlook.com','neww maadi','2017/10/3',4500,2);
insert into Trainer values(6,'mohsen','loay','12345678954326',50,'M','mohsen-loay@gmail.com','masr city','2012/9/2',5000,1);
insert into Trainer values(7,'mohamed','shady','12345678954327',54,'M','mohamed-lolo@yahoo.com','sheraton ','2015/11/2',6000,1);
insert into Trainer values(8,'ramez','amr','12345678954328',54,'M','ramez-ezz@gmail.com','tagamo3 3 ','2015/10/5',4200,2);
insert into Trainer values(9,'ali','abo el enen','12345678954329',44,'M','ali-enen@outlookcom','tagamo3 5 ','2013/12/5',4400,2);
insert into Trainer values(10,'samia','loay','22345678954328',33,'F','samia-lolo@gmail.com','madinty  ','2014/10/5',5000,1);
select * from Trainer

--Insertion in Trainer phone table
insert into Trainer_phone values('01145718652',1),('01145718652',2),('01045718652',1),('01245718652',1),('01245718652',2);
insert into Trainer_phone values('01145618652',4),('01145719652',5),('01245718687',6),('01233718652',7),('01245777652',8);
insert into Trainer_phone values('01545718652',9),('01115718652',10),('01225718652',3),('01135718652',3),('01245718633',8);
insert into Trainer_phone values('01145718699',10),('01145718688',5),('01045718622',7),('01245718652',8),('01245766652',7);
select * from Trainer_phone

--Insertion in Trainer Qualification table
insert into Trainer_qualification values(1,'gold gym certificate'), (1,'bulk gym certificate'),(1,'aamt certificate');
insert into Trainer_qualification values(2,'hulk gym certificate'), (2,' arab certificate'),(2,'emit certificate');
insert into Trainer_qualification values(3,'peak gym certificate'), (3,'national certificate');
insert into Trainer_qualification values(4,'station gym certificate');
insert into Trainer_qualification values(5,'balace gym certificate');
insert into Trainer_qualification values(6,'bulk gym certificate'),(6,'arab certificate');
insert into Trainer_qualification values(7,'national gym certificate'), (7,'transformers gym certificate'),(7,'natural certificate');
insert into Trainer_qualification values(8,'3 years of experience'), (8,'gold gym certificate');
insert into Trainer_qualification values(9,'10 years of experience'), (9,'balance gym certificate');
insert into Trainer_qualification values(10,'2 years of experience');
select* from Trainer_qualification


--Insertion in Employee table
insert into Employee values(1,'hassan','elgbaly','98765432132567',60,'M','hassan-gebaly@gmail.com','nasr city','1999/12/2',20000,3,null);
insert into Employee values(2,'yousra','elozy','98765432132566',55,'F','yousra-lola@gmail.com','cairo city','2001/10/2',15000,3,null);
insert into Employee values(3,'mohsen','el attar','98765432132565',25,'M','mohsen-atta@gmail.com','maadi','2015/12/2',2000,4,1);
insert into Employee values(4,'maysa','hassan','98765431132564',30,'F','maysa-hoss@yahoo.com','masr el gdeda','2020/4/1',2000,6,2);
insert into Employee values(5,'maher','abdo','98765483132565',24,'M','maher-abdo@outlook.com','maadi el gdeda','2021/5/1',1500,4,2);
insert into Employee values(6,'yassr','ali','98765432132563',23,'M','yasser-alola@yahoo.com','tagamo3','2021/4/1',1500,5,1);
insert into Employee values(7,'maysa','hassan','98735432132564',30,'F','maysa-hoss@yahoo.com','masr el gdeda','2020/4/1',1000,4,2);
insert into Employee values(8,'fares','fayz','98765432132562',30,'M','fares-fayz@gmail.com',' sheraton','2021/5/1',3000,6,2);
insert into Employee values(9,'salma','amr','98765432132561',35,'F','salma-amr@gmail.com','maadi el gdeda','2022/1/1',3200,5,1);
insert into Employee values(10,'youssef','omar','98765432132560',27,'M','youssef-omar@outlook.com','nasr city','2019/2/3',1500,5,1);
select * from Employee

--Insertion in Employee_phone table
insert into Employee_phone values('01079306730',1);
insert into Employee_phone values('01079306731',1);
insert into Employee_phone values('01079306732',2);
insert into Employee_phone values('01079306733',3);
insert into Employee_phone values('01079306734',4); 
insert into Employee_phone values('01179306734',4);
insert into Employee_phone values('01279306730',5);
insert into Employee_phone values('01059306730',6);
insert into Employee_phone values('01079306737',7);
insert into Employee_phone values('01079308730',8);
insert into Employee_phone values('01079309930',9);
insert into Employee_phone values('01073346730',5);
insert into Employee_phone values('01079666730',6);
insert into Employee_phone values('01889346730',7);
insert into Employee_phone values('01044346730',4);
insert into Employee_phone values('01044446730',3);
select * from Employee_phone

--Insertion in Workout_Plan table
insert into Workout_Plan values(1,'2 Months to Bulk','A full program of diet plan and workouts to bulk in 2 months','2 month');
insert into Workout_Plan values(2,'4 Months to Bulk','A full program of diet plan and workouts to bulk in 4 months','4 month');
insert into Workout_Plan values(3,'4 Weeks to Bulk','A full program of diet plan and workouts to bulk in 4 weeks','4 weeks');
insert into Workout_Plan values(4,'2 Months to Shred','A full program of diet plan and workouts to shred in 2 months','2 month');
insert into Workout_Plan values(5,'4 Months to Shred','A full program of diet plan and workouts to shred in 4 months','4 month');
insert into Workout_Plan values(6,'4 Weeks to Shred','A full program of diet plan and workouts to shred in 4 weeks','4 weeks');
insert into Workout_Plan values(7,'2 Months to LW','A full program of diet plan and workouts to lose weight in 2 months','2 month');
insert into Workout_Plan values(8,'4 Months to LW','A full program of diet plan and workouts to lose weight in 4 months','4 month');
insert into Workout_Plan values(9,'4 Weeks to LW','A full program of diet plan and workouts to lose weight in 4 weeks','4 weeks');
insert into Workout_Plan values(10,'1 Month of Fitness','A full program of diet plan and workouts to have a fit body in 1 month','1 month');
select * from Workout_Plan

--Insertion in Member_workoutplan_Trainer table
insert into Member_workoutplan_Trainer values(3, 5,1, '2020/12/12'),(7, 5,10, '2018/1/1'),(10, 7,1, '2020/6/11'),(7,2,6,'2014/12/31'),(3, 10,2, '2022/1/1');
insert into Member_workoutplan_Trainer values(3,7,1, '2020/5/24'),(4, 4,2, '2028/10/18'),(10, 9,2, '2020/9/11'),(9,9,2,'2012/12/31'),(3, 10,2, '2021/1/1');
select * from Member_workoutplan_Trainer

--Insertion in Machine table
insert into Machine values(1,'leg press','focuses on all leg muscles','2022/5/9')
insert into Machine values(2,'leg extension','focuses on quads','2022/5/9')
insert into Machine values(3,'leg curl','focuses on hamstrings','2022/5/9')
insert into Machine values(4,'chest press','focuses on mid chest','2021/10/20')
insert into Machine values(5,'butterfly','focuses on mid chest','2021/10/20')
insert into Machine values(6,'ichest press','focuses on upper chest','2021/10/20')
insert into Machine values(7,'sh press','focuses on all shoulder muscles','2022/1/1')
insert into Machine values(8,'lateral raise','focuses on lateral shoulder','2022/1/1')
insert into Machine values(9,'front raise','focuses on front shoulder','2022/1/1')
insert into Machine values(10,'smith machine','general-purpose machine','2020/8/30')
insert into Machine values(11,'lat pulldown','focuses on lats','2020/8/30')
insert into Machine values(12,'row','focuses on lats','2020/8/30')
select * from Machine

--Insertion in class table
insert into Class values(1,3,'kickbox','wednesday','12:00 pm'),(2,3,'kung fu','wednesday','3:00 pm'),(3,4,'Yoga','thursday','2:00 pm');
insert into Class values(4,3,'zumba','thursday','4:00 pm'),(5,4,'cycling','friday','3:00 pm'),(6,5,'aerobics','saturday','4:00 pm');
insert into Class values(7,5,'fitnees','thursday','4:00 pm'),(8,8,'karatee','wednesday','3:00 pm'),(9,9,'mma','sunday','8:00 pm'),(10,9,'taekowndo','sunday','10:00 pm');
select* from Class

--Insertion in member class table
insert into Member_class values(1,1,3,'2021/2/2'),(1,4,3,'2021/2/3');
insert into Member_class values(2,2,3,'2022/3/2'),(2,7,5,'2021/2/10');
insert into Member_class values(3,9,9,'2022/4/2'),(3,8,8,'2022/6/3');
insert into Member_class values(4,3,4,'2023/6/2'),(4,6,5,'2023/6/19');
insert into Member_class values(5,7,5,'2025/2/1');
insert into Member_class values(6,10,9,'2021/2/2'),(1,5,4,'2021/3/3');
insert into Member_class values(7,10,9,'2022/3/2'),(7,9,9,'2021/4/3');
insert into Member_class values(8,2,3,'2023/10/2'),(8,3,4,'2023/11/3');
insert into Member_class values(9,7,5,'2023/12/1'),(9,6,5,'2023/11/3');
insert into Member_class values(10,1,3,'2021/2/2'),(10,4,3,'2021/3/3'),(10,5,4,'2021/10/3');
select * from Member_class

------------Selects -----------

--Retrieve Full name and address of all members living in nasr city
select mfname+' '+mlname 'Full Name',address
from Member
where address = 'nasr city' ;

--Retrieve Full name, address and gender of all members contain m in their first name
select mfname+' '+mlname  'Full Name' , address , gender
from Member
where address = 'nasr city' and mfname like '%M%' ;

--Retrieve Full name, address , gender and weight of all members whose weight greater than or = 80 
select  mfname+' '+mlname  'Full Name' , address , gender,  weight
from Member
where weight >=80

--Retrieve Full name, address , gender and weight of all members whose weight smaller than or = 66
select  mfname+' '+mlname  'Full Name' , address , gender,  weight
from Member
where weight <=66 ;

--Retrieve all employees full name , age , gender and salary whose salary greater than 4000 and order salary asc
select   efname+' '+elname  'Full Name' , e_gender 'gender', e_salary'salary' , e_age 'age'   
from Employee
where e_salary > 4000 
order by e_salary ;

--for all employees having the same manager, retrieve the number of employees having  salary greater than 1500
select   count(*) 'number of employees' , manager_id ' mananger'
from Employee
where e_salary > 1500  and manager_id is not null
group by manager_id

--for all employees having the same manager and the summation of their salaries >6000, retrieve the number of employees
select   count(*) 'number of employees' , manager_id ' mananger'
from Employee
where manager_id is not null
group by manager_id
having SUM(e_salary) >6000

--Retrieve the summation of salaries of male class trainers
select sum(t_salary) 'salary'
from Trainer
where rid=2 and t_gender='M'

--retrieve the fname of members in class yoga
select mfname,cname
from Member m inner join Member_class mc inner join Class c
on c.cid = mc.cid 
on m.mid = mc.mid
where cname = 'yoga'

--retrieve the fname and salary of the trainer who train class kickbox
select tfname , t_salary
from Trainer t inner join Class c
on t.tid=c.tid
where c.cname= 'kickbox'

--retrieve the full name , salary and gender of employees having salary greater than the average
select efname + ' '+ elname 'full name ' , e_salary  ' salary', e_gender 'gender'
from Employee
where e_salary > ( select avg(e_salary)
                   from Employee ) ;

--retrieve the member fname, ssn , membership id and membership duaration  for memberships that either have or don't have members 
select m.mfname , m.mssn , ms.msid, ms_duration
from Member m right outer join Membership ms 
on m.msid = ms.msid ;


				  ---- --View-------

--Table of employees their salaries smaller than the average
create view EmpSalaries_smaller_Average as
select efname + ' '+ elname 'full name ' , e_salary , e_gender 
from Employee
where e_salary < ( select avg(e_salary)
                   from Employee ) ;

select * from EmpSalaries_smaller_Average

-- group by gender , Retrieve from EmpSalaries_smaller_Average the sum of salaries od the group containing more than 3 employees
select sum(e_salary) 'SUM OF SALARIES',e_gender 'gender '
from EmpSalaries_smaller_Average
group by e_gender
having count(*) >3


--Adding missing Columns to Member Table 
alter table Member add  m_Start_Date Date  ;
alter table Member add  m_End_Date Date  ;
--update the new columns values
update  Member set m_Start_Date='2020/4/3',  m_End_Date='2021/4/3'where mid in (1,2);
update  Member set m_Start_Date='2020/7/8',  m_End_Date='2021/1/3'where mid=3;
update  Member set m_Start_Date='2023/05/06',  m_End_Date='2023/6/06'where mid=4;
update  Member set m_Start_Date='2024/05/04',  m_End_Date='2024/9/06'where mid=5;
update  Member set m_Start_Date='2015/04/03',  m_End_Date='2015/07/03'where mid=6;
update  Member set m_Start_Date='2014/12/04',  m_End_Date='2015/5/04'where mid=7;
update  Member set m_Start_Date='2022/11/03',  m_End_Date='2023/1/03'where mid=8;
update  Member set m_Start_Date='2023/04/03',  m_End_Date='2024/2/03'where mid=9;
update  Member set m_Start_Date='2020/04/03',  m_End_Date='2021/04/03'where mid=10;
select * from Member












































