-- b)For those departments in which more than one person takes courses, find the average salary by department.

SELECT Department, AVG(Salary) FROM Employee 
WHERE Department IN (SELECT Department FROM (SELECT * FROM Course 
LEFT JOIN Employee ON Employee.ID = Course.EmpID) AS Dept GROUP BY Department 
HAVING COUNT(Department)>1) GROUP BY Department;

-- Without Index:
-- 
-- +---------------+-------------+
-- | Department    | AVG(Salary) |
-- +---------------+-------------+
-- | department34  |    171.4965 |
-- | department54  |    161.1351 |
-- | department70  |    159.3875 |
-- | department64  |    158.6670 |
-- | department33  |    162.3730 |
-- | department55  |    160.2930 |
-- | department1   |    160.5860 |
-- | department15  |    163.4443 |
-- | department58  |    160.3978 |
-- | department66  |    161.5722 |
-- | department74  |    160.0744 |
-- | department27  |    160.9370 |
-- | department79  |    153.2150 |
-- | department46  |    161.5209 |
-- | department38  |    159.7906 |
-- | department99  |    160.1209 |
-- | department78  |    151.0306 |
-- | department100 |    163.2644 |
-- | department16  |    165.4646 |
-- | department84  |    162.6217 |
-- | department56  |    160.9630 |
-- | department69  |    158.6913 |
-- | department89  |    160.0377 |
-- +---------------+-------------+
-- 94 rows in set (51.78 sec)
-- It took 51.78sec to query
-- 
-- After Adding Index to EmpID:

mysql> CREATE  INDEX ceid ON Course(EmpID);                                  
-- Query OK, 0 rows affected (0.08 sec)
-- Records: 0  Duplicates: 0  Warnings: 0
-- +---------------+-------------+
-- | Department    | AVG(Salary) |
-- +---------------+-------------+
-- | department34  |    171.4965 |
-- | department54  |    161.1351 |
-- | department70  |    159.3875 |
-- | department64  |    158.6670 |
-- | department83  |    167.3116 |
-- | department37  |    156.0226 |
-- | department87  |    154.1187 |
-- | department4   |    155.6012 |
-- | department26  |    154.7959 |
-- | department79  |    153.2150 |
-- | department46  |    161.5209 |
-- | department38  |    159.7906 |
-- | department99  |    160.1209 |
-- | department84  |    162.6217 |
-- | department56  |    160.9630 |
-- | department69  |    158.6913 |
-- | department89  |    160.0377 |
-- +---------------+-------------+
-- 94 rows in set (0.46 sec)
-- It took 0.46sec to query
