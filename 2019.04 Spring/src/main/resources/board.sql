use board;
truncate table board;


create table board
(
	bno			int			Auto_increment primary key,
	title		varchar(150)	not null,
	content		text			not null,
	writer		varchar(10)		not null,
	regdate		DATETIME DEFAULT   CURRENT_TIMESTAMP,
	view_coount int 	default 0
);

insert into board (title, content, writer)
values ('공지사항1', '공지사항1', '관리자');
insert into board (title, content, writer)
values ('공지사항2', '공지사항2', '관리자');
insert into board (title, content, writer)
values ('공지사항3', '공지사항3', '관리자');

select * from board;

create table tbl_attach ( 
  uuid varchar(100) PRIMARY KEY,
  uploadPath varchar(200) not null,
  fileName varchar(100) not null, 
  filetype char(1) default 'I',
  bno int,
  CONSTRAINT fk_board_attach FOREIGN KEY (bno) REFERENCES board(bno)
);

create table users
(
	username varchar(50) not null primary key,
	password varchar(50) not null,
	endable char(1)	default '1'
);

create table authorities
(
	username varchar(50) not null,
	authority varchar(50) not null,
	constraint fk_authorities_users foreign key(username) references users(username)
);


insert into users (username, password) values ('관리자', 'admin');
insert into authorities (username, authority) values ('관리자', 'ROLE_ADMIN'); 