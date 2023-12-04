
CREATE DATABASE jonawell;

\c jonawell;


DROP SCHEMA PUBLIC CASCADE;


CREATE SCHEMA PUBLIC;


CREATE TABLE Person(pid integer, pname text, city text, primary key (pid));


CREATE TABLE Company(cname text, headquarter text, primary key (cname));


CREATE TABLE Skill(skill text, primary key (skill));


CREATE TABLE worksFor(pid integer, cname text, salary integer, primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text, city text, primary key (cname,
                                                                 city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill
        (pid integer, skill text, primary key (pid,
                                               skill),
         foreign key (pid) references Person (pid) on delete cascade,
         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer, mid integer, primary key (eid,
                                                               mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));


CREATE TABLE Knows(pid1 integer, pid2 integer, primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));


INSERT INTO Person
VALUES (1001,
        'Jean',
        'Cupertino'), (1002,
                       'Vidya',
                       'Cupertino'), (1003,
                                      'Anna',
                                      'Seattle'), (1004,
                                                   'Qin',
                                                   'Seattle'), (1005,
                                                                'Megan',
                                                                'MountainView'), (1006,
                                                                                  'Ryan',
                                                                                  'Chicago'), (1007,
                                                                                               'Danielle',
                                                                                               'LosGatos'), (1008,
                                                                                                             'Emma',
                                                                                                             'Bloomington'), (1009,
                                                                                                                              'Hasan',
                                                                                                                              'Bloomington'), (1010,
                                                                                                                                               'Linda',
                                                                                                                                               'Chicago'), (1011,
                                                                                                                                                            'Nick',
                                                                                                                                                            'MountainView'), (1012,
                                                                                                                                                                              'Eric',
                                                                                                                                                                              'Cupertino'), (1013,
                                                                                                                                                                                             'Lisa',
                                                                                                                                                                                             'Indianapolis'), (1014,
                                                                                                                                                                                                               'Deepa',
                                                                                                                                                                                                               'Bloomington'), (1015,
                                                                                                                                                                                                                                'Chris',
                                                                                                                                                                                                                                'Denver'), (1016,
                                                                                                                                                                                                                                            'YinYue',
                                                                                                                                                                                                                                            'Chicago'), (1017,
                                                                                                                                                                                                                                                         'Latha',
                                                                                                                                                                                                                                                         'LosGatos'), (1018,
                                                                                                                                                                                                                                                                       'Arif',
                                                                                                                                                                                                                                                                       'Bloomington'), (1019,
                                                                                                                                                                                                                                                                                        'John',
                                                                                                                                                                                                                                                                                        'NewYork');


INSERT INTO Company
VALUES ('Apple',
        'Cupertino'), ('Amazon',
                       'Seattle'), ('Google',
                                    'MountainView'), ('Netflix',
                                                      'LosGatos'), ('Microsoft',
                                                                    'Redmond'), ('IBM',
                                                                                 'NewYork'), ('ACM',
                                                                                              'NewYork'), ('Yahoo',
                                                                                                           'Sunnyvale');


INSERT INTO worksFor
VALUES (1001,
        'Apple',
        65000), (1002,
                 'Apple',
                 45000), (1003,
                          'Amazon',
                          55000), (1004,
                                   'Amazon',
                                   55000), (1005,
                                            'Google',
                                            60000), (1006,
                                                     'Amazon',
                                                     55000), (1007,
                                                              'Netflix',
                                                              50000), (1008,
                                                                       'Amazon',
                                                                       50000), (1009,
                                                                                'Apple',
                                                                                60000), (1010,
                                                                                         'Amazon',
                                                                                         55000), (1011,
                                                                                                  'Google',
                                                                                                  70000), (1012,
                                                                                                           'Apple',
                                                                                                           50000), (1013,
                                                                                                                    'Yahoo',
                                                                                                                    55000), (1014,
                                                                                                                             'Apple',
                                                                                                                             50000), (1015,
                                                                                                                                      'Amazon',
                                                                                                                                      60000), (1016,
                                                                                                                                               'Amazon',
                                                                                                                                               55000), (1017,
                                                                                                                                                        'Netflix',
                                                                                                                                                        60000), (1018,
                                                                                                                                                                 'Apple',
                                                                                                                                                                 50000), (1019,
                                                                                                                                                                          'Microsoft',
                                                                                                                                                                          50000);


INSERT INTO companyLocation
VALUES ('Apple',
        'Bloomington'), ('Amazon',
                         'Chicago'), ('Amazon',
                                      'Denver'), ('Amazon',
                                                  'Columbus'), ('Google',
                                                                'NewYork'), ('Netflix',
                                                                             'Indianapolis'), ('Netflix',
                                                                                               'Chicago'), ('Microsoft',
                                                                                                            'Bloomington'), ('Apple',
                                                                                                                             'Cupertino'), ('Amazon',
                                                                                                                                            'Seattle'), ('Google',
                                                                                                                                                         'MountainView'), ('Netflix',
                                                                                                                                                                           'LosGatos'), ('Microsoft',
                                                                                                                                                                                         'Redmond'), ('IBM',
                                                                                                                                                                                                      'NewYork'), ('Yahoo',
                                                                                                                                                                                                                   'Sunnyvale');


INSERT INTO Skill
VALUES ('Programming'), ('AI'), ('Networks'), ('OperatingSystems'), ('Databases'), ('WebDevelopment');


INSERT INTO personSkill
VALUES (1001,
        'Programming'), (1001,
                         'AI'), (1002,
                                 'Programming'), (1002,
                                                  'AI'), (1004,
                                                          'AI'), (1004,
                                                                  'Programming'), (1005,
                                                                                   'AI'), (1005,
                                                                                           'Programming'), (1005,
                                                                                                            'Networks'), (1006,
                                                                                                                          'Programming'), (1006,
                                                                                                                                           'OperatingSystems'), (1007,
                                                                                                                                                                 'OperatingSystems'), (1007,
                                                                                                                                                                                       'Programming'), (1009,
                                                                                                                                                                                                        'OperatingSystems'), (1009,
                                                                                                                                                                                                                              'Networks'), (1010,
                                                                                                                                                                                                                                            'Networks'), (1011,
                                                                                                                                                                                                                                                          'Networks'), (1011,
                                                                                                                                                                                                                                                                        'OperatingSystems'), (1011,
                                                                                                                                                                                                                                                                                              'AI'), (1011,
                                                                                                                                                                                                                                                                                                      'Programming'), (1012,
                                                                                                                                                                                                                                                                                                                       'AI'), (1012,
                                                                                                                                                                                                                                                                                                                               'OperatingSystems'), (1012,
                                                                                                                                                                                                                                                                                                                                                     'Programming'), (1013,
                                                                                                                                                                                                                                                                                                                                                                      'Programming'), (1013,
                                                                                                                                                                                                                                                                                                                                                                                       'OperatingSystems'), (1013,
                                                                                                                                                                                                                                                                                                                                                                                                             'Networks'), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                           'OperatingSystems'), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                 'AI'), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                         'Networks'), (1015,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       'Programming'), (1015,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        'AI'), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                'OperatingSystems'), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      'AI'), (1017,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              'Programming'), (1018,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               'AI'), (1019,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       'Networks'), (1003,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     'WebDevelopment');


INSERT INTO hasManager
VALUES (1004,
        1003), (1006,
                1003), (1015,
                        1003), (1016,
                                1004), (1016,
                                        1006), (1008,
                                                1015), (1010,
                                                        1008), (1007,
                                                                1017), (1002,
                                                                        1001), (1009,
                                                                                1001), (1014,
                                                                                        1012), (1011,
                                                                                                1005);


INSERT INTO Knows
VALUES (1011,
        1009), (1007,
                1016), (1011,
                        1010), (1003,
                                1004), (1006,
                                        1004), (1002,
                                                1014), (1009,
                                                        1005), (1018,
                                                                1009), (1007,
                                                                        1017), (1017,
                                                                                1019), (1019,
                                                                                        1013), (1016,
                                                                                                1015), (1001,
                                                                                                        1012), (1015,
                                                                                                                1011), (1019,
                                                                                                                        1006), (1013,
                                                                                                                                1002), (1018,
                                                                                                                                        1004), (1013,
                                                                                                                                                1007), (1014,
                                                                                                                                                        1006), (1004,
                                                                                                                                                                1014), (1001,
                                                                                                                                                                        1014), (1010,
                                                                                                                                                                                1013), (1010,
                                                                                                                                                                                        1014), (1004,
                                                                                                                                                                                                1019), (1018,
                                                                                                                                                                                                        1007), (1014,
                                                                                                                                                                                                                1005), (1015,
                                                                                                                                                                                                                        1018), (1014,
                                                                                                                                                                                                                                1017), (1013,
                                                                                                                                                                                                                                        1018), (1007,
                                                                                                                                                                                                                                                1008), (1005,
                                                                                                                                                                                                                                                        1015), (1017,
                                                                                                                                                                                                                                                                1014), (1015,
                                                                                                                                                                                                                                                                        1002), (1018,
                                                                                                                                                                                                                                                                                1013), (1018,
                                                                                                                                                                                                                                                                                        1010), (1001,
                                                                                                                                                                                                                                                                                                1008), (1012,
                                                                                                                                                                                                                                                                                                        1011), (1002,
                                                                                                                                                                                                                                                                                                                1015), (1007,
                                                                                                                                                                                                                                                                                                                        1013), (1008,
                                                                                                                                                                                                                                                                                                                                1007), (1004,
                                                                                                                                                                                                                                                                                                                                        1002), (1015,
                                                                                                                                                                                                                                                                                                                                                1005), (1009,
                                                                                                                                                                                                                                                                                                                                                        1013), (1004,
                                                                                                                                                                                                                                                                                                                                                                1012), (1002,
                                                                                                                                                                                                                                                                                                                                                                        1011), (1004,
                                                                                                                                                                                                                                                                                                                                                                                1013), (1008,
                                                                                                                                                                                                                                                                                                                                                                                        1001), (1008,
                                                                                                                                                                                                                                                                                                                                                                                                1019), (1019,
                                                                                                                                                                                                                                                                                                                                                                                                        1008), (1001,
                                                                                                                                                                                                                                                                                                                                                                                                                1019), (1019,
                                                                                                                                                                                                                                                                                                                                                                                                                        1001), (1004,
                                                                                                                                                                                                                                                                                                                                                                                                                                1003), (1006,
                                                                                                                                                                                                                                                                                                                                                                                                                                        1003), (1015,
                                                                                                                                                                                                                                                                                                                                                                                                                                                1003), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                        1004), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                1006), (1008,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1015), (1010,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1008), (1017,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1013), (1002,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1001), (1009,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1001), (1011,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1005), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1012), (1012,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1001), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1001), (1018,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1001);

\qecho 'Problem 2' 
/*
“Find the pid of each person that knows at least 2 people, such
that at least 1 of them works at Apple or Netflix .”
A possible way to write this query in Pure SQL is
     select distinct p.pid from Person p, Knows k1, Knows k2
     where k1.pid1 = p.pid
     and k2.pid1 = p.pid
     and k1.pid2 <> k2.pid2
     and exists (
     select 1 from worksFor w
     where (w.pid = k1.pid2 or w.pid = k2.pid2)
     and (w.cname = 'Apple' or w.cname = 'Netflix'));

Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step. */
--Getting rid of exists
\qecho 'Getting rid of the exists'
select distinct p.pid 
from Person p, Knows k1, Knows k2, worksFor w
where k1.pid1 = p.pid
and k2.pid1 = p.pid
and k1.pid2 <> k2.pid2
and (w.pid = k1.pid2 or w.pid = k2.pid2)
and (w.cname = 'Apple' or w.cname = 'Netflix');
--Adding in joins
\qecho 'Adding in joins'
select distinct p.pid 
from Person p join Knows k1 on p.pid=k1.pid1 join Knows k2 on (p.pid=k2.pid1 and k1.pid2 <>k2.pid2)
join (select w.pid from worksFor w where (w.cname = 'Apple' or w.cname = 'Netflix')) as w on w.pid = k1.pid2 or w.pid=k2.pid2;
--Getting rid of the nested or in the W table
\qecho 'Getting rid of the nested or in the w table'
select distinct p.pid 
from Person p join Knows k1 on p.pid=k1.pid1 join Knows k2 on (p.pid=k2.pid1 and k1.pid2 <>k2.pid2)
join (select w.pid
	  from worksFor w
	  where w.cname = 'Apple'
	  union
	  select w.pid
	  from worksFor w
	  where w.cname = 'Netflix') as w on w.pid = k1.pid2 or w.pid=k2.pid2;

\qecho 'Problem 3';
/*
Return the the pair (p, c) where p is the pid of a person, and c is the cname of the company such that 
 (1) p is managed by someone who has at-least 2 skills 
 (2) and (p) does not know anyone that lives in Seattle
 
A possible way to write this query in Pure SQL is

select p.pid, c.cname
from person p , company c, worksfor w
where p.pid = w.pid and c.cname = w.cname
and exists (
	select 1 from hasManager m, personSkill ps1, personSkill ps2 
	where m.eid = p.pid and ps1.pid = m.mid and ps2.pid = m.mid
	and ps1.skill <> ps2.skill
)
and p.pid not in (
	select k1.pid1 from knows k1 
	where k1.pid2 in (select p1.pid from person p1 where p1.city='Seattle')
);

Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/ 
\qecho 'Getting rid of the in from the not in'
select distinct p.pid, c.cname
from person p , company c, worksfor w
where p.pid = w.pid and c.cname = w.cname
and exists (
select 1 from hasManager m, personSkill ps1, personSkill ps2
where m.eid = p.pid and ps1.pid = m.mid and ps2.pid = m.mid
and ps1.skill <> ps2.skill
)
and p.pid not in (
select distinct k1.pid1 from knows k1, person p1
where k1.pid2 = p1.pid
and p1.city='Seattle'
);

\qecho 'Getting rid of the not in and the person table because worksFor pid'
select distinct w.pid, c.cname
from company c, worksfor w
where w.pid = w.pid and c.cname = w.cname
and exists (
(select 1 
from hasManager m, personSkill ps1, personSkill ps2
where m.eid = w.pid and ps1.pid = m.mid and ps2.pid = m.mid
and ps1.skill <> ps2.skill)
except
(select 1
from hasManager m, personSkill ps1, personSkill ps2, knows k1, person p1
where m.eid = w.pid and ps1.pid = m.mid and ps2.pid = m.mid
and ps1.skill <> ps2.skill
and k1.pid2 = p1.pid
and k1.pid1 = w.pid
and p1.city='Seattle'));

\qecho 'Getting rid of the exists'
select distinct w.pid, c.cname
from company c, worksfor w, hasManager m, personSkill ps1, personSkill ps2, knows k1, person p1
where c.cname = w.cname
and m.eid = w.pid
and ps1.pid = m.mid
and ps2.pid = m.mid
and ps1.skill <> ps2.skill
except
(select w.pid, c.cname
from company c, worksFor w, hasManager m, personSkill ps1, personSkill ps2, knows k1, person p1
where m.eid = w.pid and ps1.pid = m.mid and ps2.pid = m.mid
and c.cname = w.cname
and ps1.skill <> ps2.skill
and k1.pid2 = p1.pid
and k1.pid1 = w.pid
and p1.city='Seattle');

\qecho 'doing the joins'
select distinct w.pid, c.cname
from company c join worksfor w on c.cname=w.cname
join hasManager m on w.pid=m.eid
join personSkill ps1 on m.mid=ps1.pid
join personSkill ps2 on m.mid=ps2.pid
where ps1.skill <> ps2.skill
except
(select w.pid, c.cname
 from company c join worksfor w on c.cname=w.cname
	join hasManager m on w.pid=m.eid
	join personSkill ps1 on m.mid=ps1.pid
	join personSkill ps2 on m.mid=ps2.pid
 	join knows k1 on k1.pid1= w.pid
 	join person p1 on k1.pid2 = p1.pid
 	where ps1.skill <> ps2.skill
 	and p1.city='Seattle');

\qecho 'Moving the constant even tho I dont have to'
select distinct w.pid, c.cname
from company c join worksfor w on c.cname=w.cname
join hasManager m on w.pid=m.eid
join personSkill ps1 on m.mid=ps1.pid
join personSkill ps2 on m.mid=ps2.pid
where ps1.skill <> ps2.skill
except
(select w.pid, c.cname
 from company c join worksfor w on c.cname=w.cname
	join hasManager m on w.pid=m.eid
	join personSkill ps1 on m.mid=ps1.pid
	join personSkill ps2 on m.mid=ps2.pid
 	join knows k1 on k1.pid1= w.pid
 	join (select p1.pid from person p1 where p1.city='Seattle') as p1 on k1.pid2 = p1.pid
 	where ps1.skill <> ps2.skill);
\qecho 'Moving the clauses from the same schema'
select distinct w.pid, c.cname
from company c join worksfor w on c.cname=w.cname
join hasManager m on w.pid=m.eid
join personSkill ps1 on m.mid=ps1.pid
join personSkill ps2 on (m.mid=ps2.pid and ps1.skill <> ps2.skill) 
except
(select w.pid, c.cname
 from company c join worksfor w on c.cname=w.cname
	join hasManager m on w.pid=m.eid
	join personSkill ps1 on m.mid=ps1.pid
	join personSkill ps2 on (m.mid=ps2.pid and ps1.skill <> ps2.skill)
 	join knows k1 on k1.pid1= w.pid
 	join (select p1.pid from person p1 where p1.city='Seattle') as p1 on k1.pid2 = p1.pid);

\qecho 'Problem 4';
/*
“Return each skill that is the skill of at least 2 persons, such that
at least 1 of them lives in Bloomington”
• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL
\qecho 'Getting rid of the nested exist'
select s.skill from skill s
where exists (
	select distinct s.skill
	from personskill ps1, personskill ps2, person p
	where ps1.pid <> ps2.pid
	and ps1.skill = ps2.skill and s.skill = ps1.skill
	and (ps1.pid = p.pid or ps2.pid = p.pid)
	and p.city = 'Bloomington'
);

\qecho 'Getting rid of the actual exists'
select distinct s.skill
from skill s, personskill ps1, personskill ps2, person p
where ps1.pid <> ps2.pid
and ps1.skill = ps2.skill 
and s.skill = ps1.skill
and (ps1.pid = p.pid or ps2.pid = p.pid)
and p.city = 'Bloomington';

\qecho 'doing joins'
select distinct s.skill
from skill s join personskill ps1 on (s.skill=ps1.skill)
join personskill ps2 on (ps1.skill=ps2.skill)
join person p on (ps1.pid = p.pid or ps2.pid = p.pid)
where p.city = 'Bloomington';

\qecho 'Moving the constants just because'
select distinct s.skill
from skill s join personskill ps1 on (s.skill=ps1.skill)
join personskill ps2 on (ps1.skill=ps2.skill)
join (select p.pid from person p where p.city='Bloomington') as p on (ps1.pid = p.pid or ps2.pid = p.pid)
;


 \qecho 'Problem 5';
/*
“Return the pair (p, s) where p is the pid of a person that works at
a company headquartered in MountainView and s is the minimum salary
among all people that know p.”
• Formulate this query in Pure SQL.*/
/*• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL
\qecho 'Translating the mv'
with mv
as (select P.pid
	from person P join worksfor W on (P.pid=W.pid)
	join company C on (W.cname = C.cname)
	where C.headquarter = 'MountainView'),
all_that_know_p
	as (select mv.pid,W.salary
	from mv MV,knows K,worksfor W
	where K.pid2 = mv.pid and W.pid = K.pid1
	order by 1),
min_salary
	as (select distinct ATP.pid,ATP.salary
	from all_that_know_p ATP
	where not exists (select 1 from all_that_know_p ATP1 where ATP.salary >
	ATP1.salary and ATP1.pid = ATP.pid))
select * from min_salary;

\qecho 'Translating the all_that_know_p'
with mv
as (select P.pid
	from person P join worksfor W on (P.pid=W.pid)
	join company C on (W.cname = C.cname)
	where C.headquarter = 'MountainView'),
all_that_know_p
	as (select mv.pid,W.salary
		from mv MV join knows K on (mv.pid=K.pid2)
		join worksFor W on (K.pid1=W.pid)
		order by 1),
min_salary
	as (select distinct ATP.pid,ATP.salary
	from all_that_know_p ATP
	where not exists (select 1 from all_that_know_p ATP1 where ATP.salary >
	ATP1.salary and ATP1.pid = ATP.pid))
select * from min_salary;

\qecho 'Translating the not_exists in min salary'
with mv
as (select P.pid
	from person P join worksfor W on (P.pid=W.pid)
	join company C on (W.cname = C.cname)
	where C.headquarter = 'MountainView'),
all_that_know_p
	as (select mv.pid,W.salary
		from mv MV join knows K on (mv.pid=K.pid2)
		join worksFor W on (K.pid1=W.pid)
		order by 1),
min_salary
	as (select distinct q.pid,q.salary
	from (select ATP.pid, ATP.salary
		  from all_that_know_p ATP
		  except
		  select ATP.pid, ATP.salary
	      from all_that_know_p ATP, all_that_know_p ATP1
		  where ATP.salary > ATP1.salary 
		  and ATP1.pid = ATP.pid) q)
select * from min_salary;

\qecho 'Adding joins'
with mv
as (select P.pid
	from person P join worksfor W on (P.pid=W.pid)
	join company C on (W.cname = C.cname)
	where C.headquarter = 'MountainView'),
all_that_know_p
	as (select mv.pid,W.salary
		from mv MV join knows K on (mv.pid=K.pid2)
		join worksFor W on (K.pid1=W.pid)
		order by 1),
min_salary
	as (select distinct q.pid,q.salary
	from (select ATP.pid, ATP.salary
		  from all_that_know_p ATP
		  except
		  select ATP.pid, ATP.salary
	      from all_that_know_p ATP join all_that_know_p ATP1 on (ATP.salary> ATP1.salary and ATP1.pid =ATP.pid)) q)
select * from min_salary;

\qecho 'Getting rid of the constant'
with mv
as (select P.pid
	from person P join worksfor W on (P.pid=W.pid)
	join (select C.cname from company C where C.headquarter ='MountainView') C on (W.cname = C.cname)),
all_that_know_p
	as (select mv.pid,W.salary
		from mv MV join knows K on (mv.pid=K.pid2)
		join worksFor W on (K.pid1=W.pid)
		order by 1),
min_salary
	as (select distinct q.pid,q.salary
	from (select ATP.pid, ATP.salary
		  from all_that_know_p ATP
		  except
		  select ATP.pid, ATP.salary
	      from all_that_know_p ATP join all_that_know_p ATP1 on (ATP.salary> ATP1.salary and ATP1.pid =ATP.pid)) q)
select * from min_salary;

 \qecho 'Problem 6';
/*
“Return each cname such that
(1) at least 1 person working there has the OperatingSystems skill
(2) at least 2 persons working there live in different cities”
• Formulate this query in Pure SQL.
Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/
\qecho 'Translating the and exists'
select distinct C.cname 
from company C, worksFor W1, worksFor W2, person P1, person P2
where exists (select 1
	from worksfor W,personskill PS
	where W.cname = C.cname
	and W.pid = PS.pid
	and PS.skill = 'OperatingSystems')
and W1.cname = C.cname
and W2.cname = C.cname 
and W1.pid = P1.pid
and W2.pid = P2.pid 
and W1.pid <> W2.pid
and P1.city <> P2.city;

\qecho 'Translating the where exists'
select distinct C.cname 
from company C, worksFor W1, worksFor W2, person P1, person P2, worksfor W,personskill PS
where W.cname = C.cname
and W.pid = PS.pid
and PS.skill = 'OperatingSystems'
and W1.cname = C.cname
and W2.cname = C.cname 
and W1.pid = P1.pid
and W2.pid = P2.pid 
and W1.pid <> W2.pid
and P1.city <> P2.city;

\qecho 'Adding joins'
select distinct C.cname 
from company C join worksFor W on (W.cname = C.cname)
join personSkill PS on (W.pid = PS.pid)
join worksFor W1 on (W1.cname = C.cname)
join worksFor W2 on (W2.cname = C.cname and W1.pid <> W2.pid)
join person P1 on (P1.pid = W1.pid)
join person P2 on (W2.pid = P2.pid and P1.city <> P2.city)
where PS.skill = 'OperatingSystems';

\qecho 'Getting rid of the constant to get rid of the where'
select distinct C.cname 
from company C join worksFor W on (W.cname = C.cname)
join (select PS.pid from personSkill PS where PS.skill='OperatingSystems') PS on (W.pid = PS.pid)
join worksFor W1 on (W1.cname = C.cname)
join worksFor W2 on (W2.cname = C.cname and W1.pid <> W2.pid)
join person P1 on (P1.pid = W1.pid)
join person P2 on (W2.pid = P2.pid and P1.city <> P2.city);

 \c postgres;


DROP DATABASE jonawell;
