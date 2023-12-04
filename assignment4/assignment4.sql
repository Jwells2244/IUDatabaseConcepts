-- Script for Assignment 4

-- Creating database with full name

CREATE DATABASE jonawell;

-- Connecting to database 
\c jonawell

-- Relation schemas and instances for assignment 4

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));
			

CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

\qecho 'Problem 6'
/*Find each pair (c, p) where c is the city and p is the pid of the person
that lives in c, and earns the lowest salary among all persons living in c. You must not use set 
predicates in this query*/
create or replace function pidsInCity (cit TEXT)
returns SETOF INTEGER as
$$
	select p.pid from person p where p.city = cit
$$ LANGUAGE SQL;
create or replace function salariesAtCity (cit TEXT)
returns INTEGER as
$$
	select MIN(w.salary) from person p natural join worksFor w where p.city = cit
$$ LANGUAGE SQL;
select p.city as c, p.pid as p
from person p natural join worksFor w
where w.salary = salariesAtCity(p.city)
order by c, p;


\qecho 'Problem 7'
/*Let p1 be a person and N be the set of skills of Netflix employees. 
Find the pid and name of each person p1 if p1 has less then 2 of the skills in N i.e. 
the combined set of job skills of persons who work for Netflix.
*You must not use set predicates in this query.*/
create view NetflixEmployees as
select w.pid from worksFor w where w.cname ='Netflix';
create view netflixEmployeeSkills as
select distinct s.skill
from personSkill s
where s.pid in (select pid from NetflixEmployees);

with PersonNetflixSkills AS (
    SELECT ps.pid, COUNT(DISTINCT 
        CASE 
            WHEN ps.skill IN (SELECT skill FROM netflixEmployeeSkills) THEN ps.skill
        END
    ) AS num_common_skills
    FROM personSkill ps
    GROUP BY ps.pid
)
select p.pid, p.pname
from Person p
left join PersonNetflixSkills pns on p.pid = pns.pid
where (pns.num_common_skills < 2 or pns.num_common_skills IS NULL);


\qecho 'Problem 8'
/*Find each pid of a person who knows at least two people who (a) work for
Apple and (b) who make less than 60000.
You must not use set predicates in this query.*/
create or replace view brokeAppleEmployees as
select w.pid
from (select w.pid, w.salary from worksFor w where w.cname ='Apple') w
where w.salary < 60000;

SELECT k.pid1
FROM Knows k
JOIN brokeAppleEmployees b ON k.pid2 = b.pid
GROUP BY k.pid1
HAVING COUNT(DISTINCT k.pid2) >= 2;


\qecho 'Problem 9'
/*Find the pid and name of each person who knows at least
3 people who each have at most 2 managers.*/
create or replace function knowsPerson(pid INTEGER)
returns table (pid INTEGER) AS
	$$
	select k.pid2
	from knows k
	where k.pid1 = pid
	$$ LANGUAGE SQL;
create or replace view hasTwoManagers as (
	select p.pid as pid, p.pname
	from person p, hasManager hm
	where p.pid = hm.eid
	group by p.pid
	having count(hm.mid) <= 2);
select p.pid, p.pname
from person p
where (
	select count(*)
	from (
		select pid
		from knowsPerson(p.pid)
		intersect
		select pid
		from hasTwoManagers)
	q)
	>= 3;


\qecho 'Problem 10'
/*Find the cname of each company that employs an even
number of persons who have at least 2 skills*/
create or replace view peopleWithAtLeastTwoSkills as(
select ps.pid
from personSkill ps
group by ps.pid
having count(ps.pid) >= 2
order by ps.pid);
--select * from peopleWithAtLeastTwoSkills;
create or replace function pidsAtCompany(companyName VARCHAR)
returns table (pid INTEGER) AS
	$$
	select w.pid
	from worksFor w
	where w.cname = companyName
	$$ LANGUAGE SQL;
--select * from pidsAtCompany('Google');

select distinct c.cname
from company c
where (
	select count(*)
	from (
		select pid
		from pidsAtCompany(c.cname)
		intersect
		select pid
		from peopleWithAtLeastTwoSkills)
	q)
	% 2 = 0;


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE jonawell;
