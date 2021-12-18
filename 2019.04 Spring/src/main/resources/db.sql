use board;

drop table BOARD1;
truncate table board1;

CREATE TABLE board1
(
	bno				int		auto_increment		primary key,
	title			varchar(150)	not null,
	content			text			not null,	
	writer			varchar(10)		not null,
	regdate			date
);

insert into board1 (title, content, writer)
values ('공지사항1', '◈ 혁신도시 가족간 온라인 커뮤니티 구축을 위해 다음과 같이 혁신도시 소식지 
10.9월호〔제39호〕를 발간하였습니다', '관리자');
insert into board1 (title, content, writer)
values ('공지사항2', '◈ 혁신도시 가족간 온라인 커뮤니티 구축을 위해 다음과 같이 혁신도시 소식지 
10.9월호〔제39호〕를 발간하였습니다', '관리자');
insert into board1 (title, content, writer)
values ('공지사항3', '◈ 혁신도시 가족간 온라인 커뮤니티 구축을 위해 다음과 같이 혁신도시 소식지 
10.9월호〔제39호〕를 발간하였습니다', '관리자');

select * from board1;

