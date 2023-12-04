-- Script for Assignment 6

-- Creating database with full name

CREATE DATABASE assignment6;

-- Connecting to database 
\c assignment6

-- Consider the lecture on Nested and Semi-structured Data models.  In
-- that lecture, we considered the {\tt studentGrades} nested relation
-- and we constructed it using a PostgreSQL query starting from the {\tt
-- Enroll} relation.

CREATE TABLE student (sid TEXT, sname TEXT, major TEXT, byear INT);
INSERT INTO student VALUES
('s100', 'Eric'  , 'CS'     , 1988),
('s101', 'Nick'  , 'Math'   , 1991),
('s102', 'Chris' , 'Biology', 1977),
('s103', 'Dinska', 'CS'     , 1978),
('s104', 'Zanna' , 'Math'   , 2001),
('s105', 'Vince' , 'CS'     , 2001);

CREATE TABLE course (cno TEXT, cname TEXT, dept TEXT);
INSERT INTO course VALUES
('c200', 'PL'      , 'CS'),
('c201', 'Calculus', 'Math'),
('c202', 'Dbs'     , 'CS'),
('c301', 'AI'      , 'CS'),
('c302', 'Logic'   , 'Philosophy');

CREATE TABLE enroll (sid TEXT, cno TEXT, grade TEXT);
insert into enroll values 
     ('s100','c200', 'A'),
     ('s100','c201', 'B'),
     ('s100','c202', 'A'),
     ('s101','c200', 'B'),
     ('s101','c201', 'A'),
     ('s102','c200', 'B'),
     ('s103','c201', 'A'),
     ('s101','c202', 'A'),
     ('s101','c301', 'C'),
     ('s101','c302', 'A'),
     ('s102','c202', 'A'),
     ('s102','c301', 'B'),
     ('s102','c302', 'A'),
     ('s104','c201', 'D');

create type studentType AS (sid text);
create type courseType as (cno text);

create type gradeCoursesType AS (grade text, courses courseType[]);
create table studentGrades(sid text, gradeInfo gradeCoursesType[]);

create type gradeStudentsType AS (grade text, students studentType[]);
create table courseGrades2(cno text, gradeInfo gradeStudentsType[]);

insert into studentGrades
with e as (select sid, grade, array_agg(row(cno)::courseType) as courses
	from enroll
	group by (sid, grade)),
f as (select sid, array_agg(row(grade, courses)::gradeCoursesType) as gradeInfo
	from e
	group by (sid))
select * from f order by sid;

insert into courseGrades2
with e as (select cno, grade, array_agg(row(sid)::StudentType) as students
	from enroll
	group by (cno, grade)),
f as (select cno, array_agg(row(grade, students)::gradeStudentsType order by
grade) as
gradeInfo
	from e
	group by (cno))
select * from f order by cno, gradeInfo;


\qecho 'Problem 1'

--Write a PostgreSQL view courseGrades that creates the nested relation of type
--(cno,gradeInfo{(grade,students{(sid)})})

--This view should compute for each course, the grade information of the
--students enrolled in this course. In particular, for each course and for
--each grade, this relation stores in a set the students who obtained that
--grade in that course.
CREATE VIEW courseGrades AS
WITH e AS (
    SELECT cno, grade, ARRAY_AGG(row(sid)::StudentType) AS students
    FROM enroll
    GROUP BY cno, grade
),
f AS (
    SELECT cno, ARRAY_AGG(row(grade, students)::gradeStudentsType ORDER BY grade) AS gradeInfo
    FROM e
    GROUP BY cno
)
SELECT * FROM f ORDER BY cno;

SELECT * FROM courseGrades;




\qecho 'Problem 2'

--Starting from the courseGrades view in Problem 1 solve the following query
--Find each (s, C) pair where s is the sid of a students and C is
--the set of cnos of courses in which the student received an ‘A’ or
--a ‘B’ but not a ‘C’. The type of your answer relation should be (sid : text, Courses : {(cno : text)}).

select e.sid as sid1, array_agg(cG.cno) as courses
from enroll e, courseGrades cG
where cG.cno = e.cno and
e.grade IN ('A', 'B') AND NOT EXISTS (
	select 1
	from enroll e2
	where e2.sid=e.sid and e2.cno = e.cno and e2.grade='C'
	)
	group by e.sid;




\qecho 'Problem 3'

--Write a PostgreSQL view jcourseGrades that creates a semi-structured
--database which stores jsonb objects whose structure conforms with the
--structure of tuples as described for the courseGrades in Problem 1.
--Test your view.

CREATE VIEW jcourseGrades AS
WITH e AS (
    SELECT cno, grade, jsonb_agg(json_build_object('sid',sid)) AS students
    FROM enroll
    GROUP BY cno, grade
),
f AS (
    SELECT jsonb_build_object('cno',cno, 'gradeInfo',
    array_to_json(array_agg(json_build_object('grade', grade, 'students',
    students) order by grade))) as cno
    FROM e
    GROUP BY cno
)
SELECT * FROM f ORDER BY cno;

select * from jcourseGrades;

\qecho 'Problem 4'

-- Write a PL/pgSQL function that takes an array of integers as input 
-- and returns a new array where each element is the sum of all the 
-- elements in the input array up to and including that element. 
-- For example, if the input array is [1, 2, 3, 4], the output array should be [1, 3, 6, 10].
create or replace function cumulative_sum(input INTEGER[])
returns INTEGER[] as
$$
DECLARE
	OUTPUT INTEGER[];
	curSum INTEGER := 0;
BEGIN
	FOR i in 1..array_length(input, 1) LOOP
		curSum := curSum + input[i];
		OUTPUT[i] := curSum;
	END LOOP;

	RETURN OUTPUT;
END;
$$
LANGUAGE plpgsql;

SELECT cumulative_sum(ARRAY[1, 2, 3, 4]);

\qecho 'Problem 5'

-- Write a function that takes a positive integer as input and 
-- returns an array of all the prime numbers up to and including that integer.
create or replace function find_primes(n INTEGER)
RETURNS INTEGER[] AS
$$
DECLARE
	returnList INTEGER[] := '{}';
	is_prime BOOLEAN;
BEGIN
	FOR i in 2..n LOOP
		is_prime := TRUE;

		for j in 2..floor(sqrt(i)) LOOP
			IF i % j = 0 THEN
				is_prime := FALSE;
				EXIT;
			END IF;
		END LOOP;

		IF is_prime THEN
			returnList := returnList || i;
		END IF;
	END LOOP;

	return returnList;
END;
$$
language plpgsql;

select find_primes(13);


\qecho 'Problem 6'

-- same generation

create table PC(parent int, child int);

insert into PC values 
   (1,2),
   (1,3),
   (1,4),
   (2,5),
   (2,6),
   (3,7),
   (4,8),
   (5,9),
   (7,10),
   (7,11),
   (9,12);

-- Consider a parent-child relation PC(parent, child). (You can assume
-- that PC is a rooted tree and the domain of the attributes parent
-- and child is int.) An edge (p,c) in PC indicates that node p is a
-- parent of node c. Now consider a pair of nodes (m,n) in PC (m and n
-- maybe the same nodes.) We say that m and n are in the same
-- generation when the distance from m to the root of PC is the same
-- as the distance from n to the root of PC.

-- Consider the following recursive query that computes the {\tt
-- sameGeneration} relation:

/*
WITH RECURSIVE sameGeneration(m, n) AS
          ((SELECT parent, parent FROM PC) UNION (select child, child from PC)
          UNION
          SELECT  t1.child, t2.child
          FROM    sameGeneration pair, PC t1, PC t2
          WHERE   pair.m = t1.parent and pair.n = t2.parent)
SELECT DISTINCT pair.m, pair.n from sameGeneration pair order by m, n;
*/

-- Write a non-recursive function sameGeneration() in the language
-- plpgsql that computes the sameGeneration relation.

CREATE OR REPLACE FUNCTION nodeDistance(node int) RETURNS int AS
$$
DECLARE
    distance int := 0;
    current_node int := node;
    isRoot boolean = false;
BEGIN
	WHILE NOT isRoot LOOP
		IF (current_node NOT IN (Select child from PC)) THEN
			isRoot := true;
			return distance;
		ELSE
			distance := distance + 1;
			current_node := (select distinct parent from PC where child=current_node);
		END IF;
	END LOOP;
END;
$$ LANGUAGE plpgsql;
	


CREATE OR REPLACE FUNCTION sameGeneration() RETURNS TABLE(m int, n int) AS $$
DECLARE
    m_val int;
    n_val int;
BEGIN
    CREATE TEMPORARY TABLE temp_result AS
        SELECT DISTINCT t1.parent AS m, t2.parent AS n
        FROM PC t1, PC t2
        WHERE nodeDistance(t1.parent) = nodeDistance(t2.parent)
	UNION
	SELECT DISTINCT t1.child AS m, t2.child AS n
        FROM PC t1, PC t2
        WHERE nodeDistance(t1.child) = nodeDistance(t2.child);
    RETURN QUERY SELECT * FROM temp_result ORDER BY m, n;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM sameGeneration();




\c postgres

drop database assignment6;
