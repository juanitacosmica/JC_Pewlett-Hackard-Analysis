---------------------------------------------------------------
-- DELIVERABLE 1: The Number of Retiring Employees by Title.
---------------------------------------------------------------
-- # of retiring employees by Title:
SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--SELECT * FROM retirement_titles;

-- # of retiring employees without duplicates:
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--SELECT * FROM unique_titles;

-- # of employees about to retire by most recent job title:
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

--SELECT * FROM retiring_titles;

---------------------------------------------------------------------
-- DELIVERABLE 2: The Employees Eligible for the Mentorship Program.
---------------------------------------------------------------------
-- Create a Mentorship Eligibility table:
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

--SELECT * FROM mentorship_eligibility;

-------------------------------------------------------------------
--DELIVERABLE 3: A written report on the employee database analysis
-------------------------------------------------------------------
-- Bonus: 2 additional queries to provide insight into "silver tsunami".
-- Roles per People & Dept.: 
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO unique_titles_department
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

--SELECT * FROM unique_titles_department;

-- How many roles will need to be fill per title and department?
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO roles_to_fill
FROM (SELECT title, dept_name from unique_titles_department) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

--SELECT * FROM roles_to_fill;

-- Qualified staff, retirement-ready to mentor next generation.
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO qualified_people
FROM (SELECT title, dept_name from unique_titles_department) as ut
WHERE ut.title IN ('Senior Engineer', 'Senior Staff', 'Technique Leader', 'Manager')
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

--SELECT * FROM qualified_people;