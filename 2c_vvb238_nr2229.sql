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
-- After Adding Index:
-- +-----------------+
-- | AVG(Emp.Salary) |
-- +-----------------+
-- |        104.4444 |
-- +-----------------+
-- 1 row in set (0.01 sec)
-- It took 0.01sec to query



