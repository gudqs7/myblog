create table article
(
       id number(4) primary key ,
       title varchar2(200) not null,
       content clob null,
       pubdate date not null ,
       author varchar2(20) null,
       looktime number(4) not null,
       love number(4) not null,
       pic varchar2(100) not null,
       typeid number(4) not null,
       state number(4) not null
);

create table type
(
       id number(4) primary key ,
       name varchar2(50) not null
);

create table message
(
       id number(4) primary key ,
       ip varchar2(20) null,
       name varchar2(20) null,
       pic varchar2(200) null,
       content varchar2(1000) null,
       leavedate date not null,
       reply varchar2(1000) null
);

create table broken
(
      id number(4) primary key ,
      content varchar2(1000) not null,
      pic varchar(100) null,
      pubdate date not null
);

alter table article
add constraint fk_typeid foreign key (typeid) references type(id);

create sequence seq_blog;
