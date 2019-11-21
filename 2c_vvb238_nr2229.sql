-- c)Find the average salary earned by people taking the course of prof1038.

SELECT AVG(Emp.Salary) from Employee Emp, Course C  WHERE C.Prof='prof1038' AND C.EmpID=Emp.ID;

-- Without Index:
-- +-----------------+
-- | AVG(Emp.Salary) |
-- +-----------------+
-- |        104.4444 |
-- +-----------------+
-- 1 row in set (0.05 sec)
-- It took 0.05 sec to query
-- 
CREATE  INDEX prof ON Course(Prof);
-- Query OK, 0 rows affected (0.04 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- Indexes on Course(EmpID) and Employee(ID) are already created in the previous two subparts of question 2.

SELECT AVG(Emp.Salary) from Employee Emp, Course C  WHERE C.Prof='prof1038' AND C.EmpID=Emp.ID;
-- After Adding Index:
-- +-----------------+
-- | AVG(Emp.Salary) |
-- +-----------------+
-- |        104.4444 |
-- +-----------------+
-- 1 row in set (0.01 sec)
-- It took 0.01 sec to query



