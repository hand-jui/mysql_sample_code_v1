use employees;
-- 현재 'Senior'가 포함되지 않는 직급에 속해 있는 사원들 중,
-- 현재 급여를 65000 ~ 66000 사이로 받고 있는 사원들의 수를 구하시오.
-- 단, FROM 절과 WHERE 절 모두 서브 쿼리를 사용하시오.
SELECT Count(*)
FROM (
	SELECT *
    FROM titles
    WHERE title NOT LIKE 'senior%' AND to_date = '9999-01-01'
) AS f
JOIN salaries AS s
ON f.emp_no = s.emp_no
WHERE salary IN (
	SELECT salary
    FROM salaries
    WHERE salary BETWEEN 65000 AND 66000
) AND s.to_date = '9999-01-01';

-- employees 테이블과 salaries테이블을 이용하여 
-- 연봉이 100000 이상인 사람 중 연봉이 높은 순으로 사번, 연봉, 고용일을 출력하시오.
-- 단, 중첩 서브쿼리(WHERE절)를 사용하시오.
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
SELECT dm.dept_no, e.emp_no, e.last_name, e.first_name, e.birth_date
FROM employees AS e
INNER JOIN dept_manager AS dm 
ON e.emp_no = dm.emp_no
WHERE e.emp_no IN
	(SELECT emp_no
	 FROM dept_manager
	 WHERE to_date='9999-01-01');
     
-- 1998년 이후 기준으로 봉급 제일 많이 받는 부서 순으로 조회해보세요
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT d.dept_name
FROM salaries AS s
JOIN dept_emp AS de
ON s.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE salary IN (
	SELECT salary
    FROM salaries AS s
    WHERE from_date >= '1998-01-01'
    GROUP BY emp_no
)
GROUP BY d.dept_name
ORDER BY salary desc;

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
SELECT ROUND(AVG(salary),2)
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

-- 개발 부서중 Susumu Picht 보다 입사일이 늦은사람 모두의 부서이름과 입사일, 사원정보를 출력하세요
SELECT dept_name, e.*
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE hire_date >= (
	SELECT hire_date
    FROM employees
    WHERE first_name = 'Susumu' AND last_name = 'Picht'
);

-- 사원 중 남자인 직원들의 emp_no, dept_no, from_date, to_date를
-- join을 사용하지 않고 서브쿼리를 이용하여 출력해보자
SELECT *
FROM dept_emp
WHERE emp_no IN (
	SELECT emp_no
    FROM employees
    WHERE gender = 'M'
);

-- employees DB에 기록된 58~60년생 사이 사원들의 부서번호를 검색해보세요
-- 출력 조건은 상관X(최소 emp_no, dept_no는 나와야합니다)
SELECT emp_no, dept_no
FROM dept_emp
WHERE emp_no IN (
	SELECT emp_no
    FROM employees
    WHERE birth_date BETWEEN '1958-01-01' AND '1960-12-31'
);
    
-- 1985년에 입사한 직원들의 현재 연봉과 1990년에 입사한 직원들의 현재 연봉을 테이블로 나타내기
SELECT salary
FROM (
	SELECT s.salary
    FROM employees AS e
    JOIN salaries AS s
    ON e.emp_no = s.emp_no
    WHERE e.hire_date like '1985-%' OR e.hire_date like '1990-%'
) AS h
WHERE salary IN (
	SELECT salary
    FROM salaries
    WHERE to_date='9999-01-01'
); 

-- from_date가 1990-01-01 이상인 개발부서 사원의 데이터를 출력하세요
-- 개발 부서의 from_date가 1990-01-01 보다 이상인 데이터를 출력하세요. 중첩쿼리문을 꼭 사용하세요!
SELECT *
FROM dept_emp AS de
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'development' AND de.from_date IN (
	SELECT from_date
    FROM dept_emp
    WHERE from_date >= '1990-01-01'
);

-- 인라인 뷰를 이용하여 성이 K로 시작하는 퇴사한 사람들의 가장 높은 연봉과 퇴사일 출력
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT s.salary, to_date
FROM (
	SELECT *
    FROM employees AS e
    JOIN 
    WHERE first_name LIKE 'K%'
) AS name
JOIN salaries AS s
WHERE ;

SELECT *
    FROM employees
    WHERE first_name LIKE 'K%';

-- Marketing 부서중 2000년 01월 01 일 이후에(from_date) 입사한 남자의 
-- 이름과 생일,성별을 출력하시오.
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT salary, to_date
FROM () AS 
WHERE ;




-- 인라인 뷰를 이용해서 생일이 1960년생 중 현재 일하고있는 
-- 사람들의 고용일과 부서이름을 출력하시오.
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT salary, to_date
FROM () AS 
WHERE ;




-- 1. 현재 title에 Staff가 들어가는 직원들 중
-- 2. 현재 salary가 높은 순서로 200명을 뽑은 뒤
-- 3. emp_no가 6자리인 직원들의 인원수와
-- 4. title이 'Staff'인 직원의 인원수를 뽑아
-- 5. 한테이블에 표시하라
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT salary, to_date
FROM () AS 
WHERE ;


-- 현재 Engineer 중 입사일이 1989-08-24 이후인 사원들의
-- 사번, 직급, 성, 이름, 성별, 입사일을 입사일 기준 오름차순으로 출력해보자
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT salary, to_date
FROM () AS 
WHERE ;

-- 95년 이후 입사한 직원 중 title이 한번이상 바뀐 직원들을 테이블에 표시하라.
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT salary, to_date
FROM () AS 
WHERE ;

-- 개발 부서중 월급이 70000원 이상인 사람 
-- 그리고 last_name이 N으로 시작하는 하고 n으로 끝나는 사람중 생일이 1월4일인 사람을 구하세요.(like 절 쓰지않기)
-- 구한 사람의 생년월일과 last_name, 월급을 오름차순으로 구하세요
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT e.birth_date, e.last_name, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE emp.no IN (
	SELECT emp.no
    FROM 


);

-- 현재 title이 Senior Engineer인 사람들 중 birth_date가 1955-06-01 이상인 사원들의
-- 사번,이름,직급,성별,입사일을 나타내세요.
SELECT e.emp_no, e.last_name, e.first_name, t.title, e.gender, e.hire_date
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title IN (
	SELECT title
    FROM titles
    WHERE to_date = '9999-01-01' AND title = "Senior Engineer"
)
AND e.birth_date IN (
	SELECT birth_date
    FROM employees
    WHERE birth_date >= '1955-06-01'
);


