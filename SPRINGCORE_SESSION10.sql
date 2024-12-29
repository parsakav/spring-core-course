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
    FULLNAME varchar(10),
    RELATIONSHIP varchar,
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
