-- Data Analysis 
-- Question 1 List the employee number, last name, first name, sex, and salary of each employee.
Select employees.emp_no as employee_number, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
join salaries 
on employees.emp_no = salaries.emp_no

-- Question 2 List the first name, last name, and hire date for the employees who were hired in 1986
Select employees.first_name, employees.last_name, employees.hire_date
From employees
Where employees.hire_date like '%1986'

-- Question 3 List the manager of each department along with their department number, department name,
-- employee number, last name, and first name

select departments.dept_name as department_name, dept_manager.dept_no as department_number, employees.emp_no 
as employee_number, employees.last_name, employees.first_name 
from dept_manager 
left join employees
on employees.emp_no = dept_manager.emp_no
left join departments
on departments.dept_no = dept_manager.dept_no


-- Question 4 List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
select dept_manager.dept_no as department_number, dept_manager.emp_no as employee_number, e.last_name, e.first_name,
departments.dept_name
from dept_manager 
left join employees e
on e.emp_no = dept_manager.emp_no
left join departments
on departments.dept_no = dept_manager.dept_no

-- Question 5 List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B.

Select e.first_name, e.last_name, e.sex
from employees e
where e.first_name = 'Hercules' and e.last_name like 'B%'


-- Question 6 List each employee in the Sales department, including their employee number, last name, and first name.
Select departments.dept_name as department_name, dept_emp.emp_no as employee_number, e.last_name, e.first_name
from dept_emp
left join departments
on departments.dept_no = dept_emp.dept_no
left join employees e
on e.emp_no = dept_emp.emp_no
Where departments.dept_name = 'Sales'


-- Question 7 List each employee in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
Select departments.dept_name as department_name, dept_emp.emp_no as employee_number, e.last_name, e.first_name
from dept_emp
left join departments
on departments.dept_no = dept_emp.dept_no
left join employees e
on e.emp_no = dept_emp.emp_no
Where departments.dept_name = 'Sales' or departments.dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)
select e.last_name, Count(e.last_name) as Last_name_count
from employees e
group by e.last_name
order by Last_name_count DESC
