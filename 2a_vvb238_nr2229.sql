-- a)Find the number of employees who earn at least 50 more than their managers

SELECT COUNT(Emp1.ID) FROM Employee EMP1, Employee EMP2 WHERE EMP1.Salary>=EMP2.Salary+50 AND EMP1.MANAGER=EMP2.ID;

-- Without Index
-- +----------------+
-- | count(Emp1.ID) |
-- +----------------+
-- |          32880 |
-- +----------------+
-- 1 row in set (0.76 sec)
-- It took 0.76sec to query

CREATE  INDEX eid ON Employee(ID); 
-- Query OK, 0 rows affected (0.47 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

CREATE  INDEX mid ON Employee(Manager);
-- Query OK, 0 rows affected (0.19 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- After adding indexes ID and Manager:
SELECT COUNT(Emp1.ID) FROM Employee EMP1, Employee EMP2 WHERE EMP1.Salary>=EMP2.Salary+50 AND EMP1.MANAGER=EMP2.ID;
-- +----------------+
-- | count(Emp1.ID) |
-- +----------------+
-- |          32880 |
-- +----------------+
-- 1 row in set (0.34 sec)
-- 
-- It took 0.34sec to query
