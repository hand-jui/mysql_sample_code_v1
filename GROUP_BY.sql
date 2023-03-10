use employees;

SHOW TABLES;

SELECT * FROM salaries
LIMIT 10;  -- 10개 들고와라

SELECT * FROM salaries
LIMIT 10, 5;  -- 10번째부터 5개 들고와라


-- 1단계
SELECT * 
FROM salaries
GROUP BY emp_no 
HAVING emp_no = 10001;

-- GROUP BY절에 조건절을 사용할 때는 having을 사용
-- 2단계
SELECT * , count(salary)
FROM salaries
GROUP BY emp_no;

-- 3단계  max, min
SELECT * , count(salary) AS count, 
		max(salary) AS max, min(salary) AS min,
        sum(salary) AS sum , round(avg(salary),2) AS avg
FROM salaries
GROUP BY emp_no;

-- 문제 2개 생성 직접 쿼리 출력
-- 1. 성별이 'M'이면서 성이 'so'로 시작하는 사람
select * from employees;
SELECT *
FROM employees
GROUP BY gender
HAVING gender = 'M' AND last_name LIKE 'so%';
-- 2. 이름이 'u'로 시작하면서 엔지니어인 사람
SELECT employees.emp_no, employees.first_name, titles.title
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
GROUP BY emp_no
HAVING employees.first_name LIKE 'u%' AND title = 'engineer' ;

-- 문제 만들어 보기 
-- 1. emp_no로 그룹을 나누고 titles table에서 title과 salaries table에서 salary를 출력하라. (join 사용)
SELECT titles.title, salaries.salary
FROM salaries
INNER JOIN titles
ON titles.emp_no = salaries.emp_no
GROUP BY titles.emp_no;

-- 2. 위에서 출력한값에서 연봉이 65000원 이상인 사람만 출력하라. (몇명인지도 출력)
SELECT titles.title, salaries.salary
FROM salaries
JOIN titles
ON titles.emp_no = salaries.emp_no
GROUP BY titles.emp_no
HAVING salary >= 65000;

-- 3. Engineer(시니어, 어시스턴트, 일반 모두 포함)이라는 직책을 가진 사원들의 최고 연봉을 출력해라
SELECT *
FROM employees as e
left JOIN dept_emp as de
ON e.emp_no = de.emp_no
GROUP BY e.emp_no
HAVING dept_name like '%Engineer';


-- 4. 각 부서에는 몇 명이 있는지 출력해보자
SELECT *, count(de.emp_no)
FROM employees as e
left JOIN dept_emp as de
ON e.emp_no = de.emp_no
GROUP BY e.emp_no;


-- 5. 각 직급 별로 몇 명이 있는지 출력해보자
SELECT * , count(title)
FROM employees AS e
inner JOIN titles AS t
ON e.emp_no = t.emp_no
group by t.title;

-- 6. employees 테이블과 salaries 테이블을 활용해서 남자 직원의 최고 연봉을 구하시오.
SELECT max(salary)
FROM employees as e
left JOIN salaries as s
ON e.emp_no = s.emp_no
GROUP BY gender
HAVING gender='M';


