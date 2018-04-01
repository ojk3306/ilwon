drop table user_type  CASCADE CONSTRAINTS;
drop table users  CASCADE CONSTRAINTS;
drop table search_log CASCADE CONSTRAINTS;
drop table  notice CASCADE CONSTRAINTS;
drop table  proposal CASCADE CONSTRAINTS;
drop table  report CASCADE CONSTRAINTS;
drop table  classlev CASCADE CONSTRAINTS;
drop table  state CASCADE CONSTRAINTS;
drop table  categorys CASCADE CONSTRAINTS;
drop table  semina  CASCADE CONSTRAINTS;
drop table  review  CASCADE CONSTRAINTS;
drop table  semina_detail CASCADE CONSTRAINTS;
drop table  class CASCADE CONSTRAINTS;
drop table  learn_log CASCADE CONSTRAINTS;

commit;

CREATE TABLE user_type(
usertype_no number,
user_type varchar2(10) NOT NULL,
CONSTRAINT PK_USERS_type PRIMARY KEY(usertype_no)
);
insert into user_type values('1001','student');
insert into user_type values('1002','teacher');
insert into user_type values('1003','admin');
commit;

CREATE TABLE USERS
(
  USER_NO              NUMBER  PRIMARY KEY,
  USER_TYPE            NUMBER,
  USER_EMAIL           VARCHAR2(100 BYTE)       NOT NULL,
  USER_PWD             VARCHAR2(250 BYTE)       NOT NULL,
  USER_NAME            VARCHAR2(30 BYTE)        NOT NULL,
  USER_GENDER          VARCHAR2(7 BYTE)         NOT NULL,
  USER_AGE             NUMBER                   NOT NULL,
  USER_LOC             VARCHAR2(100 BYTE)       NOT NULL,
  USER_PHONE           VARCHAR2(40 BYTE)        NOT NULL,
  USER_ORIGINAL_PHOTO  VARCHAR2(250 BYTE),
  USER_RENAME_PHOTO    VARCHAR2(250 BYTE),
  USER_KEYWORD_COUNT   NUMBER                   DEFAULT 5,
  USER_LOGINABLE       VARCHAR2(3 BYTE)         DEFAULT 'Y',
  USER_EXEABLE         VARCHAR2(10 BYTE)        DEFAULT 'Y',
  USER_CLASSMAX        NUMBER                   DEFAULT 3,
  USER_ENROLLDATE      DATE                     DEFAULT sysdate,
  constraint Fk_user FOREIGN KEY (USER_TYPE) REFERENCES user_type (usertype_no)
);

commit;

CREATE TABLE search_log(
search_no number PRIMARY KEY,
user_no number, 
seach_content VARCHAR2(100) not null,
search_date date DEFAULT sysdate,
constraint Fk_searchlog FOREIGN KEY (user_no) REFERENCES USERS (USER_NO)
);
commit;
CREATE TABLE notice(
notice_no number PRIMARY key,
user_no number,
notice_title varchar2(100) not null, 
notice_date date DEFAULT sysdate,
notice_content varchar2(1000),
constraint Fk_notice FOREIGN KEY (user_no) REFERENCES USERS (USER_NO)
);
commit;
CREATE TABLE proposal(
proposal_no number PRIMARY key,
user_no number,
proposal_title varchar2(100) not null, 
proposal_date date DEFAULT sysdate,
proposal_content varchar2(1000) not null,
constraint Fk_proposal FOREIGN KEY (user_no) REFERENCES USERS (USER_NO)
);
CREATE TABLE report(
report_no number PRIMARY key,
user_no   number,
report_title  varchar2(100) not null, 
report_date date DEFAULT sysdate,
report_content  varchar2(1000) not null,
report_original_filename varchar2(1000),
report_rename_filename varchar2(1000),
constraint Fk_report FOREIGN KEY (user_no) REFERENCES USERS (USER_NO)
);
CREATE TABLE classlev(
classlev_no number PRIMARY key,
classlev VARCHAR2(30) not null
);
CREATE TABLE state(
state_no number PRIMARY key,
state VARCHAR2(10) not null
);
CREATE TABLE categorys(
category_no number PRIMARY key,
category_big VARCHAR2(30) not null,
categoru_small VARCHAR2(30) not null
);
commit;


CREATE TABLE class(
class_no number PRIMARY key,
level_no NUMBER,
state_no NUMBER,
category_no NUMBER,
user_no1 NUMBER,
user_no2 NUMBER,
class_title  VARCHAR2(100) not null,
class_location VARCHAR2(100) not null,
class_radius NUMBER not null,
class_price NUMBER not null,
class_count NUMBER not null,
class_date DATE DEFAULT sysdate,
class_contop VARCHAR2(1500) not null,
class_conmid VARCHAR2(3500) not null,
class_conbot VARCHAR2(1500) not null,
class_keyword VARCHAR2(400) not null,
constraint Fk_classlev FOREIGN KEY (level_no) REFERENCES classlev (classlev_no),
constraint Fk_classstate FOREIGN KEY (state_no) REFERENCES state (state_no),
constraint Fk_classcategory FOREIGN KEY (category_no) REFERENCES categorys (category_no),
constraint Fk_classteacher FOREIGN KEY (user_no1) REFERENCES USERS (USER_NO),
constraint Fk_classstudent FOREIGN KEY (user_no2) REFERENCES USERS (USER_NO)
);
CREATE TABLE review(
review_no number PRIMARY key,
class_no  number,
review_content VARCHAR2(1000) not null,
review_prepare NUMBER,
review_sincerity NUMBER,
review_delivery NUMBER,
review_date date DEFAULT sysdate,
constraint Fk_reviewClass FOREIGN KEY (class_no) REFERENCES class (class_no)
);
CREATE TABLE semina(
semina_no number PRIMARY key,
category_no NUMBER,
user_no NUMBER,
semina_title VARCHAR2(60) not null, 
semina_location VARCHAR2(100) not null, 
semina_price NUMBER not null, 
semina_level NUMBER not null, 
semina_startdate DATE not null, 
semina_content1 VARCHAR2(2500) not null, 
semina_content2 VARCHAR2(2500),
semina_content3 VARCHAR2(2500),
semina_content4 VARCHAR2(2500),
teacher_index NUMBER ,
semina_enddate date not null, 
semina_min NUMBER not null, 
semina_now NUMBER ,
semina_max NUMBER not null, 
constraint Fk_seminacategory FOREIGN KEY (category_no) REFERENCES categorys (category_no),
constraint Fk_seminateacher FOREIGN KEY (user_no) REFERENCES users (user_no)
);
CREATE TABLE semina_detail(
semina_detail_no number PRIMARY key,
semina_no NUMBER,
user_no NUMBER,
semina_detail_date DATE,
semina_state VARCHAR2(20),
constraint Fk_seminadetailno FOREIGN KEY (semina_no) REFERENCES semina (semina_no),
constraint Fk_seminadetailstudent FOREIGN KEY (user_no) REFERENCES users (user_no)
);
commit;
CREATE TABLE learn_log(
log_no  number PRIMARY key,
user_no1 NUMBER,
user_no2 NUMBER,
class_no NUMBER,
log_date date,
constraint Fk_learnlogstudent FOREIGN KEY (user_no2) REFERENCES USERS (USER_NO),
constraint Fk_learnlogteacher FOREIGN KEY (user_no1) REFERENCES USERS (USER_NO),
constraint Fk_learnlogClass FOREIGN KEY (class_no) REFERENCES class (class_no)
);
insert into SEARCH_LOG values('1', null , 'd' ,sysdate)