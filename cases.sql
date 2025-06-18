use gfg;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50)
);

INSERT INTO Employees (employee_id, name, age, department) VALUES
(1, 'John', 35, 'Sales'),
(2, 'Alice', 28, 'Marketing'),
(3, 'Bob', 40, 'HR'),
(4, 'Sarah', 33, 'Finance'),
(5, 'Michael', 25, 'Operations'),
(6, 'Emily', 29, 'Sales'),
(7, 'David', 42, 'HR'),
(8, 'Jessica', 31, 'Marketing'),
(9, 'Richard', 37, NULL),
(10, 'Michelle', 26, 'Finance'),
(11, 'Daniel', 34, 'Operations'),
(12, 'Laura', 38, 'Sales'),
(13, 'Mark', 27, NULL),
(14, 'Jennifer', 32, 'Marketing'),
(15, 'Andrew', 39, 'HR'),
(16, 'Elizabeth', 24, 'Finance'),
(17, 'Matthew', 30, 'Operations'),
(18, 'Samantha', 36, 'Sales'),
(19, 'Christopher', NULL, 'Marketing'),
(20, 'Stephanie', 41, 'HR'),
(21, 'Kevin', 29, 'Finance'),
(22, 'Amanda', 35, 'Operations'),
(23, 'Jason', 33, 'Sales'),
(24, 'Nicole', 28, 'Marketing'),
(25, 'Ryan', 39, 'HR'),
(26, 'Ashley', 27, NULL),
(27, 'Justin', 36, 'Finance'),
(28, 'Rachel', 31, 'Operations'),
(29, 'Eric', 40, 'Sales'),
(30, 'Megan', 25, 'Marketing'),
(31, 'Brandon', 37, 'HR'),
(32, 'Kimberly', 30, 'Finance'),
(33, 'Tyler', 24, 'Operations'),
(34, 'Heather', 38, 'Sales'),
(35, 'Jeffrey', 31, 'Marketing'),
(36, 'Melissa', 40, 'HR'),
(37, 'Scott', 26, 'Finance'),
(38, 'Tiffany', 35, 'Operations'),
(39, 'Joshua', 33, 'Sales'),
(40, 'Lauren', 29, 'Marketing'),
(41, 'Brian', 42, 'HR'),
(42, 'Christina', 27, 'Finance'),
(43, 'Kyle', 34, 'Operations'),
(44, 'Victoria', 39, 'Sales'),
(45, 'Nathan', 28, 'Marketing'),
(46, 'Amy', 36, 'HR'),
(47, 'Patrick', 25, 'Finance'),
(48, 'Kelly', 30, 'Operations'),
(49, 'Adam', 37, 'Sales'),
(50, 'Christine', 31, 'Marketing'),
(51, 'Gregory', 40, 'HR'),
(52, 'Maria', 26, 'Finance'),
(53, 'Jonathan', 38, 'Operations'),
(54, 'Lisa', 32, 'Sales'),
(55, 'Shawn', 29, 'Marketing'),
(56, 'Julie', 41, 'HR'),
(57, 'Stephen', 27, 'Finance'),
(58, 'Jamie', 34, 'Operations'),
(59, 'Rebecca', 39, 'Sales'),
(60, 'Aaron', NULL, 'Marketing'),
(61, 'Jacqueline', 35, 'HR'),
(62, 'Derek', 30, 'Finance'),
(63, 'Hannah', 24, 'Operations'),
(64, 'Edward', 37, 'Sales'),
(65, 'Cassandra', 31, 'Marketing'),
(66, 'Alexander', 40, 'HR'),
(67, 'Kristen', 26, 'Finance'),
(68, 'Zachary', 38, 'Operations'),
(69, 'April', 32, 'Sales'),
(70, 'Jeremy', 29, 'Marketing'),
(71, 'Katherine', 41, 'HR'),
(72, 'Dylan', 27, 'Finance'),
(73, 'Lindsay', 34, 'Operations'),
(74, 'Travis', 39, 'Sales'),
(75, 'Allison', 25, 'Marketing'),
(76, 'Phillip', 42, 'HR'),
(77, 'Kelsey', 28, 'Finance'),
(78, 'Cody', 36, 'Operations'),
(79, 'Bethany', 33, 'Sales'),
(80, 'Wesley', 30, 'Marketing'),
(81, 'Monica', 41, 'HR'),
(82, 'Brett', 26, 'Finance'),
(83, 'Tara', 35, 'Operations'),
(84, 'Gerald', 31, 'Sales'),
(85, 'Erin', 40, 'Marketing'),
(86, 'Donald', 27, 'HR'),
(87, 'Pamela', 38, 'Finance'),
(88, 'Logan', 32, 'Operations'),
(89, 'Christine', 39, 'Sales'),
(90, 'Justin', 25, 'Marketing'),
(91, 'Anna', 42, 'HR'),
(92, 'Bryan', 28, 'Finance'),
(93, 'Leah', 36, 'Operations'),
(94, 'Keith', 33, 'Sales'),
(95, 'Caitlin', 29, 'Marketing'),
(96, 'Alexander', 40, 'HR'),
(97, 'Cassandra', 27, 'Finance'),
(98, 'Jared', 34, 'Operations'),
(99, 'Tiffany', 39, 'Sales'),
(100, 'Joshua', 31, 'Marketing');

-- case 1 Display each employee’s name and a column that says “Senior” if their age is above 35, “Mid-Level” if between 30 and 35, and “Junior” if below 30
select name,
case
when age>35 then 'senior'
when age between 30 and 35 then 'mid-level'
else 'junior'
end as employee_age from Employees;
-- 2.Create a list showing the name, department, and a status column that says “Assigned” if the department is not NULL and “Unassigned” otherwise.

select name,department,
case
when department is not null then 'assigned'
else 'unassigned'
end as status from employees;
-- 3 Count how many employees fall into each age category: “Junior” (<30), “Mid-Level” (30–35), and “Senior” (>35).
 SELECT 
  CASE 
    WHEN age < 30 THEN 'Junior'
    WHEN age BETWEEN 30 AND 35 THEN 'Mid-Level'
    WHEN age > 35 THEN 'Senior'
    ELSE 'Unknown'
  END AS age_category,
  COUNT(*) AS total_employees
FROM employees
WHERE age IS NOT NULL
GROUP BY age_category;
-- 4. Show the number of employees per department who are younger than 30.
SELECT 
  department,
  COUNT(CASE WHEN age < 30 THEN 1 END) AS under_30,
  COUNT(CASE WHEN age >= 30 THEN 1 END) AS above_or_equal_30
FROM employees
WHERE department IS NOT NULL
GROUP BY department
order by under_30 desc , above_or_equal_30 desc ;
-- 5.Find the total number of employees and how many of them are from departments that are either ‘HR’ or ‘Finance’.
SELECT
  COUNT(*) AS total_employees,
count(case when department= 'hr' then 1 end) as Hr_department,
count(case when department= 'finance' then 1 end) as finance_department
from employees


