use org;

create table pairs (
A int,
B int
);

insert into pairs values
(1,2), (2, 4), (2, 1), (3, 2), (4, 2), (5, 6), (6, 5), (7, 8);
drop table pairs;
select * from pairs;

-- write an sql to remove reverse pairs from a table
select t1. * from pairs t1 
left join pairs t2
on t1.A = t2.B and t1.B = t2.A 
where t1.A is null or t1.A < t1.B;

select * from pairs p1 where not exists (
	select * from pairs p2 where p1.A = p2.B and p1.B = p2.A and p1.A > p2.A
);