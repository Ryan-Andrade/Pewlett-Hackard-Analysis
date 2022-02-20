-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01'AND '1955-12-31' AND t.to_date= '9999-01-01'
ORDER BY e.emp_no, t.to_date DESC;

SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01'AND '1955-12-31'
ORDER BY e.emp_no ASC;

SELECT COUNT (emp_no), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.from_date,
	d.to_date,
	t.title
INTO mentorship_eligibility
FROM Employees AS e
INNER JOIN Dept_Emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN Titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND t.to_date= '9999-01-01'
ORDER BY e.emp_no;