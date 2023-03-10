SELECT * FROM titles;
-- Staff --> 결과집합으로 Staff 직원의 이력을 결과 집합으로 만들기
-- 1
SELECT *
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t. emp_no
WHERE t.title = 'staff'
ORDER BY e.emp_no DESC
LIMIT 10;
-- 2
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t. emp_no
WHERE t.title = 'staff'
ORDER BY e.emp_no DESC
LIMIT 10;


desc employees;


-- 풀 네임받아 연봉 받은 횟수
SELECT e.first_name, e.last_name, concat_ws(' ', e.first_name, e.last_name) AS fullname, count(salary) as count 
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no
HAVING e.first_name = 'Duangkaew' AND e.last_name = 'Piveteau';
desc salaries;



SELECT e.first_name, e.last_name, concat_ws(' ', e.first_name, e.last_name) AS fullname, count(salary) as count 
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
-- WHERE concat_ws(' ', e.first_name = 'Duangkaew', e.last_name = 'Piveteau')
WHERE concat_ws(' ', e.first_name, e.last_name) = 'Duangkaew Piveteau' 
GROUP BY e.emp_no;
desc salaries;


