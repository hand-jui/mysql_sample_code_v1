-- 1단계
select * 
from employees
GROUP BY gender;

-- 2단계
select *, count(gender) 
from employees
GROUP BY gender;

--
select *, count(hire_date)
from employees
GROUP BY hire_date, gender;

-- 
select * from employees;
-- employees (1) : dept_emp (N)
select * from dept_emp;
-- dept_emp (N) : departments (1)
SELECT * from departments;

-- employees : departments --> N:M 관계 차수를 가진다.
-- 중간 테이블 dept_emp를 만들어서  N:M관계를 표현하고있다.

-- employees : dept_emp ----> 1:N 관계로 풀어진다.
-- departsment : dept_emp --> 1:N 관계로 풀어진다.

-- 1단계 
SELECT *
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2단계 중복 컬럼 제거하기
-- distinct 확인
SELECT *
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 3단계
SELECT e.emp_no, e.first_name, dp.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 4단계
SELECT e.emp_no, e.first_name, dp.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no
group by dept_no;

