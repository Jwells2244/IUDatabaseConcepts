/*In this database the pid is a very important primary and foreign key.
If it were not a foreign key than you would be able to insert a random pid
into any of these tables, such as the works for.
In addition, the same would apply to delete. If the pid was not a primary
foreign key, than you would be able to delete any entry in the table, potentially
leading to data that you can never recover. */

--DELETE FROM Company
--WHERE cname = 'Microsoft';


--INSERT INTO Company
--VALUES ('HerbaLife', 'Pasadena');
INSERT INTO COMPANY
VALUES ('APPLE', 'Seattle');


/* Question 2

SELECT DISTINCT p.pid, p.pname
FROM Person p
WHERE p.city = 'Chicago'
	AND p.pid IN (
	SELECT ps.pid
	FROM personSkill ps
	WHERE ps.skill = 'OperatingSystems')
	AND p.pid IN (
	SELECT wf.pid
	FROM worksFor wf
	WHERE wf.salary <= 55000
	);
*/
/* Question 3
SELECT DISTINCT k1.pid1
FROM Knows k1, Knows k2, Knows k3
WHERE k1.pid1 = k2.pid1
AND k1.pid1 = k3.pid1
AND k2.pid2 <> k3.pid2
AND k1.pid2 <> k2.pid2
AND k1.pid2 <> k3.pid2
ORDER BY pid1; 
*/

/* Question 4 
SELECT DISTINCT p.pid, p.pname
FROM Person p
WHERE p.city = 'Bloomington'
	AND p.pid IN (
	SELECT hm.eid
	FROM hasManager hm
	WHERE hm.mid IN (
		SELECT m.pid
		FROM Person m
		WHERE m.city = 'Cupertino')
	);
*/
/* Question 5 
SELECT DISTINCT c1.cname, c2.cname
FROM companyLocation c1, companyLocation c2
WHERE c1.cname <> c2.cname
  AND NOT EXISTS (
    SELECT 1
    FROM companyLocation c3, companyLocation c4
    WHERE c3.cname = c1.cname
      AND c4.cname = c2.cname
      AND c3.city = c4.city
  )
  ORDER BY c1.cname;
*/
/* Question 6 Ordering is wrong but it doesnt matter
SELECT DISTINCT w.cname, w.salary
FROM worksFor w
WHERE w.salary >= ALL (
	SELECT w2.salary
	FROM worksFor w2
	Where w2.cname = w.cname);
*/
/* Question 7 This works but it is awful  
SELECT DISTINCT p1.pid, p1.pname, wf1.salary
FROM Person p1, worksFor wf1, hasManager hm, Person p2, personSkill ps2
WHERE p1.pid = wf1.pid
	AND wf1.pid = hm.mid
	AND p2.pid = hm.eid
	AND p2.pid = ps2.pid
	AND EXISTS(
		SELECT 1
		FROM hasManager hm2
		WHERE hm2.mid = hm.eid)
	AND ps2.skill = 'Networks' 
UNION
SELECT DISTINCT p1.pid, p1.pname, wf1.salary
FROM Person p1, worksFor wf1, hasManager hm1
WHERE p1.pid = wf1.pid
AND p1.pid = hm1.eid
AND EXISTS(
	SELECT 1
	FROM hasManager hm2
	WHERE hm2.mid = hm1.eid
	AND EXISTS(
		SELECT 1
		FROM hasManager hm3, personSkill ps1
		WHERE hm3.mid = hm2.eid AND hm3.eid = ps1.pid
		AND ps1.skill = 'Networks'))
ORDER BY pid;
*/

/* Question 8 Ordering is wrong, but the sample ouput isnt ordered either
SELECT DISTINCT p1.pid, p1.pname
FROM person p1, worksFor wf1, hasManager hm, worksFor wf2
WHERE wf1.pid = p1.pid
	AND hm.eid = p1.pid
	AND wf2.pid = hm.mid
	AND wf1.salary > wf2.salary; 
*/

/* Question 9 WORKS but is also a stupid implementation
SELECT DISTINCT p1.pid, p1.pname
FROM Person p1, hasManager hm, Person p2
WHERE p1.pid = hm.eid
	AND hm.mid = p2.pid
	AND p1.city <> p2.city
EXCEPT(
SELECT p3.pid, p3.pname
FROM Person p3, hasManager hm2, Person p4
WHERE p3.pid = hm2.eid
	AND hm2.mid = p4.pid
	AND p3.city = p4.city)
ORDER BY pid; 
*/

/*Question 10 
SELECT DISTINCT p1.pid, p1.pname, wf1.salary
FROM Person p1, worksFor wf1, hasManager hm1, personSkill ps1, personSkill ps2, hasManager hm2, hasManager hm3, hasManager hm4
WHERE p1.pid = hm1.eid
	AND p1.pid = wf1.pid
	AND p1.pid = hm4.eid
	AND hm1.mid = hm2.eid
	AND hm4.mid = hm3.eid
	AND hm2.eid <> hm3.eid
	AND hm2.eid = ps1.pid
	AND hm3.eid = ps2.pid
	AND ps1.skill = ps2.skill
	AND ps1.skill <> 'Networks';
*/

