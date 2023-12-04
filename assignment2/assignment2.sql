CREATE DATABASE jonawell;

\c jonawell;


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
   ('Databases'),
   ('WebDevelopment');

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
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1003,'WebDevelopment');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1007, 1017),
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
 (1012,1001),
 (1014,1001),
 (1018,1001),
 (1001,1001),
 (1002,1002),
 (1003,1003),
 (1004,1004),
 (1005,1005),
 (1006,1006),
 (1007,1007),
 (1008,1008),
 (1009,1009),
 (1010,1010),
 (1011,1011),
 (1012,1012),
 (1013,1013),
 (1014,1014),
 (1015,1015),
 (1016,1016),
 (1017,1017),
 (1018,1018),
 (1019,1019);


create table PC(parent integer,
               child integer);
insert into PC values
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(3,7),
(5,8),
(8,9),
(8,10),
(8,11),
(7,12),
(7,13),
(12,14),
(14,15);

-- Find each triple (c, p, s) where c is the cname
-- of a company, p is the pid of a person who earns the lowest salary
-- at that company and knows at least someone who works at Apple,
-- and s is the salary of p.
\qecho 'Problem-1a'
select distinct w1.cname as c, p1.pid as p, w1.salary as s
from worksFor w1, Person p1
where not exists (
	select 1
	from worksFor w2
	where w2.cname = w1.cname
	and w2.salary < w1.salary
)
and p1.pid = w1.pid and exists (
	select 1
	from Knows k1
	where k1.pid1 = p1.pid and exists
	(select 1
	from worksFor w3
	where w3.pid = k1.pid2 and w3.cname = 'Apple'));

\qecho 'Problem-1b'
SELECT w1.cname AS c, p1.pid AS p, w1.salary AS s
FROM worksFor w1, Person p1
WHERE w1.cname NOT IN (
    SELECT w2.cname
    FROM worksFor w2
    WHERE w2.salary < w1.salary
)
AND p1.pid = w1.pid and p1.pid in
	(select k1.pid1
	from Knows k1
	where k1.pid1 = p1.pid and k1.pid2 in
	(select w3.pid
	from worksFor w3
	where w3.cname = 'Apple'))
	ORDER BY w1.cname;

\qecho 'Problem-1c'
SELECT DISTINCT w1.cname AS c, p1.pid AS p, w1.salary AS s
FROM worksFor w1, Person p1
where w1.pid = p1.pid
intersect(
select distinct w2.cname as c, p2.pid as p, w2.salary as s
from worksFor w2, person p2, worksFor w3, person p3, knows k
where w2.pid <> w3.pid
and w3.cname = 'Apple'
and w2.pid = k.pid1
and w3.pid = k.pid2)
except(
select w2.cname as c, p2.pid as p, w2.salary as s
from worksFor w2, person p2, worksFor w3, person p3, Knows k, worksFor w4
where w2.pid = p2.pid
and w2.cname = w3.cname
and w3.pid = p3.pid
and w2.salary>w3.salary);

-- Find each pair (c1, c2) of cnames of different
-- companies such that no employee of c1 and no employee of c2 live
-- in Chicago.
\qecho 'Problem-2a'
SELECT c1.cname AS c1, c2.cname AS c2
FROM Company c1, Company c2
WHERE c1.cname <> c2.cname
AND NOT EXISTS (
    SELECT 1
    FROM worksFor w1, Person p1
    WHERE w1.pid = p1.pid
    AND w1.cname = c1.cname
    AND p1.city = 'Chicago'
)
AND NOT EXISTS (
    SELECT 1
    FROM worksFor w2, Person p2
    WHERE w2.pid = p2.pid
    AND w2.cname = c2.cname
    AND p2.city = 'Chicago'
)
ORDER BY c1.cname;

\qecho 'Problem-2b'
SELECT c1.cname AS c1, c2.cname AS c2
FROM Company c1, Company c2
WHERE c1.cname <> c2.cname
AND c1.cname NOT IN (
    SELECT w1.cname
    FROM worksFor w1, Person p1
    WHERE w1.pid = p1.pid
    AND w1.cname = c1.cname
    AND p1.city = 'Chicago'
)
AND c2.cname NOT IN (
    SELECT w2.cname
    FROM worksFor w2, Person p2
    WHERE w2.pid = p2.pid
    AND w2.cname = c2.cname
    AND p2.city = 'Chicago'
)
ORDER BY c1.cname;

\qecho 'Problem-2c'
with fChicago as (
	select w.cname
	from Person p, worksFor w
	Where p.pid = w.pid
	and p.city = 'Chicago'
)
select a1.cname as c1, a2.cname as c2
from (select c1.cname
	 from company c1
	 except
	 select fc.cname
	 from fChicago fc) a1, (select c2.cname
						   	from company c2
						   	except
						   	select fc.cname
						   	from fChicago fc) a2
where a1.cname <> a2.cname
ORDER BY 1, 2;


\qecho 'Problem-3b'
-- Find each triple (c, p, s) where c is the
-- cname of a company, p is the pid of a person who earns the lowest
-- salary at that company and knows at least someone who works
-- at Apple, and s is the salary of p.
-- \qecho 'Problem-5b'
SELECT DISTINCT w1.cname AS c, p1.pid AS p, w1.salary AS s
FROM worksFor w1 join Person p1 on (w1.pid = p1.pid)
intersect(
select distinct w2.cname as c, w2.pid as p, w2.salary
	from worksFor w2 join worksFor w3 on (w2.pid <> w3.pid and w3.cname='Apple')
	join knows k on (w2.pid = k.pid1 and w3.pid = k.pid2))
except(
	select w3.cname as c, w3.pid as p, w3.salary as s
	from worksFor w3 join worksFor w4 on (w3.cname = w4.cname and w3.salary>w4.salary)); 

\qecho 'Problem-4b'
-- Find each pair (c1, c2) of cnames of different
-- companies such that no employee of c1 and no employee of
-- c2 live in Chicago.
with fChicago as (
	select w.cname
	from Person p join worksFor w on (p.pid = w.pid and p.city='Chicago')
)
select a1.cname as c1, a2.cname as c2
from (select c1.cname
	 from company c1
	 except
	 select fc.cname
	 from fChicago fc) a1 join (select c2.cname
						   		from company c2
						   		except
						   		select fc.cname
						   		from fChicago fc) a2 on (a1.cname <> a2.cname)
ORDER BY 1,2;

\qecho 'Problem 5'
/* Create a materialized view CompanyKnownPerson such that, for each company, the view returns the pid
of Persons who are known by atleast one different person (other than pid) from the same company and earn the same salary.
Then test your view.*/
CREATE MATERIALIZED VIEW CompanyKnownPerson as
select distinct wf.pid as pid
from worksFor wf, worksFor wf2, knows k
WHERE wf.pid <> wf2.pid
and wf.cname = wf2.cname
and wf.salary = wf2.salary
and k.pid1 = wf2.pid
and k.pid2 = wf.pid;

Select * from CompanyKnownPerson;

\qecho 'Problem 6'

/*Create a parameterized view SkillOnlyOnePerson (skill1 text) that returns pair of different persons pid1, pid2 such that
pid1 should have the skill identified by skill1 and pid2 should not have the skill identified by skill1.
Test your view for skill1 = 'Networks'.*/
CREATE OR REPLACE FUNCTION SkillOnlyOnePerson(skill1 text)
RETURNS TABLE(pid1 TEXT, pid2 TEXT) AS
$$
SELECT distinct ps1.pid as pid1, ps2.pid as pid2
from personSkill ps1
join personSkill ps2 ON ps1.pid <> ps2.pid
where ps1.skill = skill1
and ps2.pid NOT IN (
	select ps3.pid
	from personSkill ps3
	where ps3.skill = skill1)
UNION
(Select distinct ps3.pid as pid1, p.pid as pid2
from personSkill ps3, Person p
where ps3.skill = skill1
and p.pid NOT IN (
	select ps4.pid
	from personSkill ps4))
ORDER BY pid1, pid2;
$$ LANGUAGE SQL;

SELECT * FROM SkillOnlyOnePerson('Networks'); 

\qecho 'Problem 7'
/*Let PC(parent: integer, child: integer) be a rooted parent-child tree. So a pair (n,m) in PC indicates that node n is a parent of node m.
The sameGeneration(n1, n2) binary relation is inductively defined using the following two rules:
If n is a node in PC, then the pair (n,n) is in the sameGeneration relation. (Base rule)
If n_1 is the parent of m1 in PC and n2 is the parent of m2 in Tree and (n1,n2) is a pair in the sameGeneration relation then (m1,m2) is a pair in the sameGeneration relation. (Inductive Rule)

Write a recursive view for the sameGeneration relation.
Test your view. */
WITH RECURSIVE SameGeneration AS (
    SELECT parent AS n1, parent AS n2
    FROM PC
    UNION
    SELECT PC1.child AS n1, PC2.child AS n2
    FROM SameGeneration SG
    JOIN PC AS PC1 ON SG.n1 = PC1.parent
    JOIN PC AS PC2 ON SG.n2 = PC2.parent
)

SELECT * FROM SameGeneration
ORDER BY n1, n2;


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE jonawell;
