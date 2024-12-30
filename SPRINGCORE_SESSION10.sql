drop database university;

create database university;
use university;

create table DEPT(
    DEPID varchar(10) primary key ,
    DEPTITLE varchar(30) not null ,
    DEPHONE varchar(20) not null ,

)


create table STT(
    STID varchar(10) primary key ,
    STNAME varchar(20) not null ,
    STFAMILY varchar(20) not null ,
    STAGE int check(STAGE >=18 and STAGE<=90) ,
    STMJR varchar(10),
    STLEVEL varchar(3) check (STLEVEL in ('BCS','MSC','PHD')),
    DEPID varchar(10) not null,
    foreign key (DEPID) references DEPT(DEPID)
)
create table STTFAMILY(
    STID varchar(10) ,
    FULLNAME varchar(30),
    RELATIONSHIP varchar(30),
    foreign key (STID) references STT(STID),
        primary key (STID,FULLNAME)
)
create table PROFT(
    PRID varchar(10) primary key,
    PRNAME varchar(20) not null,
    PRFAMILY varchar(20) not null,
      DEPID varchar(10) not null,
    foreign key (DEPID) references DEPT(DEPID)
)

CREATE TABLE COT(
    COID varchar(10) primary key ,
    COTITLE varchar(20),
    CODEPID varchar(10) not null,
     foreign key (CODEPID) references DEPT(DEPID)

)


create TABLE STCOT(
    COID varchar(10) ,
    STID varchar(10),
    PRID varchar(10),
    TR varchar(1) check (TR in('1','2','3')),
    YEAR varchar(4),
    constraint COID_FK foreign key (COID) references COT(COID),
    constraint STID_FK foreign key (STID) references STT(STID),
    constraint PRID_FK foreign key (PRID) references PROFT(PRID),
    primary key (COID,STID,PRID)

)

CREATE table PRECOT(
    COID varchar(10) ,
PRECOID varchar(10),
        constraint PRECOT_COID_FK foreign key (COID) references COT(COID),
    constraint PRECOT_PRECOID_FK foreign key (PRECOID) references COT(COID),
primary key (COID,PRECOID)
)



--initialize tables

-- Insert sample data into DEPT
INSERT INTO DEPT (DEPID, DEPTITLE, DEPHONE) VALUES
('D01', 'Computer Science', '021-12345678'),
('D02', 'Mathematics', '021-23456789'),
('D03', 'Physics', '021-34567890'),
('D04', 'Biology', '021-45678901'),
('D05', 'Chemistry', '021-56789012'),
('D06', 'English', '021-67890123'),
('D07', 'History', '021-78901234'),
('D08', 'Philosophy', '021-89012345'),
('D09', 'Engineering', '021-90123456'),
('D10', 'Psychology', '021-01234567'),
('D11', 'Economics', '021-11234567'),
('D12', 'Law', '021-21234567'),
('D13', 'Medicine', '021-31234567'),
('D14', 'Nursing', '021-41234567'),
('D15', 'Sociology', '021-51234567'),
('D16', 'Education', '021-61234567'),
('D17', 'Art', '021-71234567'),
('D18', 'Music', '021-81234567'),
('D19', 'Sports Science', '021-91234567'),
('D20', 'Environmental Science', '021-00123456');

-- Insert sample data into STT
INSERT INTO STT (STID, STNAME, STFAMILY, STAGE, STMJR, STLEVEL, DEPID) VALUES
('S001', 'Ali', 'Ahmadi', 22, 'CS', 'BCS', 'D01'),
('S002', 'Sara', 'Karimi', 24, 'CS', 'MSC', 'D01'),
('S003', 'Reza', 'Hashemi', 21, 'Math', 'BCS', 'D02'),
('S004', 'Maryam', 'Rahimi', 28, 'Bio', 'PHD', 'D04'),
('S005', 'Hamed', 'Fazeli', 20, 'Eng', 'BCS', 'D09'),
('S006', 'Neda', 'Mohammadi', 25, 'Physics', 'MSC', 'D03'),
('S007', 'Amir', 'Jafari', 29, 'Econ', 'PHD', 'D11'),
('S008', 'Aida', 'Shirazi', 23, 'CS', 'BCS', 'D01'),
('S009', 'Mohsen', 'Dehghan', 26, 'Law', 'MSC', 'D12'),
('S010', 'Parisa', 'Eskandari', 27, 'Med', 'PHD', 'D13'),
('S011', 'Navid', 'Ramezani', 24, 'CS', 'MSC', 'D01'),
('S012', 'Farzad', 'Bahrami', 22, 'History', 'BCS', 'D07'),
('S013', 'Lida', 'Kazemi', 25, 'Sociology', 'MSC', 'D15'),
('S014', 'Pouya', 'Akbari', 30, 'Chem', 'PHD', 'D05'),
('S015', 'Nima', 'Maleki', 20, 'Eng', 'BCS', 'D09'),
('S016', 'Elaheh', 'Mousavi', 24, 'Bio', 'MSC', 'D04'),
('S017', 'Behnaz', 'Sadeghi', 23, 'CS', 'BCS', 'D01'),
('S018', 'Morteza', 'Qasemi', 26, 'Psych', 'MSC', 'D10'),
('S019', 'Hoda', 'Najafi', 28, 'Econ', 'PHD', 'D11'),
('S020', 'Shahin', 'Khalili', 27, 'CS', 'PHD', 'D01');

-- Insert sample data into STTFAMILY
INSERT INTO STTFAMILY (STID, FULLNAME, RELATIONSHIP) VALUES
('S001', 'Hossein Ahmadi', 'Father'),
('S002', 'Leila Karimi', 'Mother'),
('S003', 'Ali Hashemi', 'Brother'),
('S004', 'Zahra Rahimi', 'Sister'),
('S005', 'Reza Fazeli', 'Father'),
('S006', 'Fatemeh Mohammadi', 'Mother'),
('S007', 'Shirin Jafari', 'Wife'),
('S008', 'Ahmad Shirazi', 'Father'),
('S009', 'Mina Dehghan', 'Mother'),
('S010', 'Hamid Eskandari', 'Husband'),
('S011', 'Samira Ramezani', 'Sister'),
('S012', 'Farhad Bahrami', 'Father'),
('S013', 'Afsaneh Kazemi', 'Mother'),
('S014', 'Bahram Akbari', 'Brother'),
('S015', 'Nasim Maleki', 'Sister'),
('S016', 'Mohammad Mousavi', 'Father'),
('S017', 'Zeynab Sadeghi', 'Mother'),
('S018', 'Ramin Qasemi', 'Brother'),
('S019', 'Simin Najafi', 'Mother'),
('S020', 'Kaveh Khalili', 'Father');

-- Insert sample data into PROFT
INSERT INTO PROFT (PRID, PRNAME, PRFAMILY, DEPID) VALUES
('P001', 'Hassan', 'Zare', 'D01'),
('P002', 'Ladan', 'Farhadi', 'D02'),
('P003', 'Hamid', 'Shahabi', 'D03'),
('P004', 'Narges', 'Asgari', 'D04'),
('P005', 'Bijan', 'Afshari', 'D05'),
('P006', 'Roya', 'Ghasemi', 'D06'),
('P007', 'Saeed', 'Mansouri', 'D07'),
('P008', 'Mehrdad', 'Kiani', 'D08'),
('P009', 'Alireza', 'Moradi', 'D09'),
('P010', 'Shahin', 'Salimi', 'D10'),
('P011', 'Nazanin', 'Rezai', 'D11'),
('P012', 'Babak', 'Pourmand', 'D12'),
('P013', 'Ehsan', 'Samadi', 'D13'),
('P014', 'Nima', 'Taheri', 'D14'),
('P015', 'Simin', 'Rafiei', 'D15'),
('P016', 'Leila', 'Hosseini', 'D16'),
('P017', 'Parviz', 'Yazdani', 'D17'),
('P018', 'Nasrin', 'Shams', 'D18'),
('P019', 'Khosrow', 'Jalili', 'D19'),
('P020', 'Haleh', 'Ranjbar', 'D20');

-- Insert sample data into COT
INSERT INTO COT (COID, COTITLE, CODEPID) VALUES
('C001', 'Introduction to CS', 'D01'),
('C002', 'Data Structures', 'D01'),
('C003', 'Algorithms', 'D01'),
('C004', 'Linear Algebra', 'D02'),
('C005', 'Quantum Mechanics', 'D03'),
('C006', 'Organic Chemistry', 'D05'),
('C007', 'Cell Biology', 'D04'),
('C008', 'History of Iran', 'D07'),
('C009', 'Macroeconomics', 'D11'),
('C010', 'Introduction to Law', 'D12'),
('C011', 'Medical Ethics', 'D13'),
('C012', 'Education Theory', 'D16'),
('C013', 'Painting Basics', 'D17'),
('C014', 'Guitar Techniques', 'D18'),
('C015', 'Fitness Training', 'D19'),
('C016', 'Ecology', 'D20'),
('C017', 'Advanced Algorithms', 'D01'),
('C018', 'Compiler Design', 'D01'),
('C019', 'Operating Systems', 'D01');

-- Insert sample data into PRECOT
INSERT INTO PRECOT (COID, PRECOID) VALUES
('C002', 'C001'), -- Data Structures requires Introduction to CS
('C003', 'C002'), -- Algorithms requires Data Structures
('C017', 'C003'), -- Advanced Algorithms requires Algorithms
('C018', 'C002'), -- Compiler Design requires Data Structures
('C019', 'C003'), -- Operating Systems requires Algorithms
('C004', 'C001'), -- Linear Algebra requires Introduction to CS
('C005', 'C004'), -- Quantum Mechanics requires Linear Algebra
('C006', 'C005'), -- Organic Chemistry requires Quantum Mechanics
('C007', 'C006'), -- Cell Biology requires Organic Chemistry
('C009', 'C004'), -- Macroeconomics requires Linear Algebra
('C010', 'C009'), -- Introduction to Law requires Macroeconomics
('C012', 'C004'), -- Education Theory requires Linear Algebra
('C013', 'C001'), -- Painting Basics requires Introduction to CS
('C014', 'C013'), -- Guitar Techniques requires Painting Basics
('C015', 'C014'), -- Fitness Training requires Guitar Techniques
('C016', 'C004'); -- Ecology requires Linear Algebra


select * from COT where COID=(
select PRECOID from PRECOT where COID=(
select COID from COT where COTITLE = 'Data Structures')
);
select (select count(*) from COT)  *(select count(*) from precot); 
 ;
select * from COT,PRECOT,COT as c where COT.COID=PRECOT.COID and c.COID=PRECOT.PRECOID;
select COT.COTITLE as COT,c.COTITLE as PRECOT from COT inner join PRECOT on COT.COID=PRECOT.COID 
inner join COT as c on c.COID=PRECOT.PRECOID;

(select * from PRECOT RIGHT join COT on COT.COID=PRECOT.COID)
except (select * from PRECOT inner join COT on COT.COID=PRECOT.COID)

