--QUery for Question 1
SELECT emp_no, last_name, first_name, sex,
	(SELECT salaries FROM salaries WHERE salaries.emp_no = employees.emp_no) AS salary
FROM employees	
WHERE emp_no IN
(
SELECT emp_no
FROM salaries

);

--

--Query for Question 2
SELECT last_name, first_name, hire_date
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

--

--Query for Question 3
SELECT emp_no, last_name, first_name,
	(SELECT dept_no
	FROM dept_manager
	WHERE dept_manager.emp_no = employees.emp_no) AS dept_no,
	(SELECT dept_name
	FROM departments
	WHERE dept_no=
		(SELECT dept_no
		FROM dept_manager
		WHERE dept_manager.emp_no = employees.emp_no
		)
	) AS department_name
	FROM employees
	WHERE emp_no IN
		(SELECT emp_no
		FROM dept_manager
		);

--

--Query for Question 4 
SELECT e.emp_no, de.dept_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

--

--Query for Question 5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND
last_name IN
(SELECT last_name
FROM employees
WHERE last_name LIKE 'B%'

);

--

--Query for Question 6
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no = 'd007'
	);

--

--Query for Question 7
SELECT emp_no, last_name, first_name,
	(SELECT dept_name
	FROM departments
	WHERE dept_no=
		(SELECT dept_no
		FROM dept_emp
		WHERE dept_emp.emp_no = employees.emp_no
		AND dept_no IN ('d005', 'd007')
		)
	) AS department_name
	FROM employees
	WHERE emp_no IN
		(SELECT emp_no
		FROM dept_emp
		WHERE dept_no IN ('d005', 'd007'));

--

--Query for question 8
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
			

