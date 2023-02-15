
drop table bbs;

create table bbs(
	seq int auto_increment primary key,
	id varchar(50) not null,
	
	ref decimal(8) not null,
	step decimal(8) not null,
	depth decimal(8) not null,
	
	title varchar(200) not null,
	content varchar(4000) not null,
	wdate timestamp not null,
	
	del decimal(1) not null,
	readcount decimal(8) not null
);

alter table bbs
add foreign key(id) references member(id);

insert into bbs(id, ref, step, depth, title, content, wdate, del, readcount)
values('id', (select ifnull(max(ref), 0)+1 from bbs b), 0, 0, 'title', 'content', now(), 0, 0));

select * from bbs;


select rnum, seq, id, ref, step, depth, title, content, wdate, del, readcount 
from
(select row_number()over(order by ref desc, step asc) as rnum,
	seq, id, ref, step, depth, title, content, wdate, del, readcount 
from bbs
-- 검색
order by ref desc, step asc) a 
where rnum between 1 and 10;



update bbs
set step=step+1
where ref=(select ref from bbs where seq=?)
	and step>(select step from bbs where seq=?)

insert into bbs(id, ref, step, depth, title, content, wdate, del, readcount)
values(?, 
		(select ref from bbs where seq=?), 
		(select step from bbs where seq=?)+1,
		(select depth from bbs where seq=?)+1,
		?, ?, now(), 0, 0)
		
select * from bbs;
		
delete from bbs
where seq=39;



