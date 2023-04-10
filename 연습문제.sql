use employees;
-- 현재 'Senior'가 포함되지 않는 직급에 속해 있는 사원들 중,
-- 현재 급여를 65000 ~ 66000 사이로 받고 있는 사원들의 수를 구하시오.
-- 단, FROM 절과 WHERE 절 모두 서브 쿼리를 사용하시오.
select * from employees;
select * from titles;
select * from salaries;

SELECT count(*)
FROM (
	SELECT e.emp_no
    FROM employees AS e
	INNER JOIN salaries AS s
    ON e.emp_no = s.emp_no
    WHERE s.salary >= 65000 AND s.salary <= 66000)
WHERE title in (
		SELECT title
        FROM titles
        WHERE title NOT LIKE 'Senior%');
select * from titles;
select * from salaries;

SELECT count(emp_no)
FROM (
	SELECT emp_no
	FROM titles
	WHERE title NOT LIKE 'Senior%') as e
WHERE emp_no in (
	SELECT e.emp_no
	FROM employees AS e
	INNER JOIN salaries AS s
	ON e.emp_no = s.emp_no
	WHERE s.salary >= 65000 AND s.salary <= 66000
    group by e.emp_no
);
-- employees 테이블과 salaries테이블을 이용하여 
-- 연봉이 100000 이상인 사람 중 연봉이 높은 순으로 사번, 연봉, 고용일을 출력하시오.
-- 단, 중첩 서브쿼리(WHERE절)를 사용하시오.
select * from employees;
select * from salaries;

SELECT e.emp_no, s.salary, e.hire_date
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE salary in(
	SELECT salary
    FROM salaries 
    WHERE salary >=100000)
ORDER BY salary DESC;

SELECT *
	FROM titles
	WHERE title NOT LIKE 'Senior%';
    

        
-- 중첩 쿼리문을 사용하여 각 부서의 번호와 해당되는 부서의 현재 
-- 매니저의 사번, 성, 이름, 생일을 조회해보자
SELECT * FROM dept_manager;
SELECT * FROM employees;

SELECT dm.dept_no, e.emp_no, e.last_name, e.first_name, e.birth_date
FROM employees AS e
INNER JOIN dept_manager AS dm 
ON e.emp_no = dm.emp_no
WHERE e.emp_no IN
	(SELECT emp_no
	 FROM dept_manager
	 WHERE to_date='9999-01-01');
     
-- 1998년 이후 기준으로 봉급제일 많이 받는 부서 순으로 조회해보세요


-- SELECT d.dept_name
-- FROM departments AS d
-- INNER JOIN salaries AS s
-- ON d.

select * from titles;
-- employ테이블의 현재 연봉 상위 50명 뽑아 부서번호 기준으로 정렬하고,
-- 그 안에서 연봉 기준으로 내림차순 정렬하기
SELECT *
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
WHERE salary IN
	(SELECT salary
	   FROM salaries AS s
 INNER JOIN employees AS e
		 ON s.emp_no = e.emp_no
   GROUP BY e.emp_no
   ORDER BY salary desc
    );


select * from dept_emp;

	

-- 중첩쿼리를 사용해서 개발부(Development)에서 아직 일하는 사람 중 
-- 생일이 4월인 사람의 first_name, birth_date, dept_name,to_date를 출력하시오.

SELECT e.first_name, e.birth_date, d.dept_name, de.to_date
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no= de.emp_no
JOIN departments AS d
ON de.dept_no= d.dept_no
WHERE e.birth_date like '%-04-%' AND de.dept_no = 'd005' AND de.to_date = '9999-01-01';

-- 부서명 길이가 10 미만인 부서에 현재 속해 있는 사원들의 
-- 급여 평균을 소수점 둘째 자리까지 나타내시오.
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM salaries;


SELECT *
FROM salaries
WHERE emp_no IN (
	SELECT e.emp_no 
    FROM employees AS e
    JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
    JOIN departments AS d
    ON de.dept_no = d.dept_no
    WHERE length(d.dept_name) < 10 AND de.to_date = '9999-01-01'
    )
GROUP BY emp_no;
