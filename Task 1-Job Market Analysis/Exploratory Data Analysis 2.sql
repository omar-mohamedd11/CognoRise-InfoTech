-- Q1 What is the average salary by job title, level, and employment type?
select job_title,
	cast(avg(salary_in_usd) as unsigned) as Avg_salary_title
from salaries
group by 1
order by 2 desc;

select job_type,
	cast(avg(salary_in_usd) as unsigned) as Avg_salary_type
from salaries
group by 1
order by 2 desc;

select experience_level,
	cast(avg(salary_in_usd) as unsigned) as Avg_salary_exp
from salaries
group by 1
order by 2 desc;

-- Q2. What is the distribution of salaries across different Departments?
SELECT department,
 CAST(AVG(salary_in_usd) AS unsigned) as Average_Salary,
rank()over(order by CAST(AVG(salary_in_usd) AS unsigned) desc) as `rank`
FROM salaries
GROUP BY 1
ORDER BY 2 DESC;

-- Q3. How does salary vary by location or country?
select company_location,
	cast(avg(salary_in_usd) as unsigned) as avg_salary,
	rank()over(order by CAST(AVG(salary_in_usd) AS unsigned) desc) as `rank`
from salaries
group by 1
order by 2 desc;

-- Q4 What is the connection between company size and salaries ?
select company_size,
	cast(avg(salary_in_usd) as unsigned) as avg_salary,
	rank()over(order by CAST(AVG(salary_in_usd) AS unsigned) desc) as `rank`
from salaries
group by 1
order by 2 desc;

-- Q5. What are the top 5 highest-paying job titles in each location?
with top_5_countries as 
(
select company_location,
	job_title,
    Salary_in_usd,
	rank()over(partition by company_location order by Salary_in_usd desc) as `rank`
from salaries
)
select *
from top_5_countries
where `rank` <= 5
order by company_location;

-- Q6. What is the most common employment type (full-time, part-time, freelance) for each department?
select department,
	job_type,
    count(*) as employees_num
from salaries
group by 1,2
order by 3 desc ;

-- Q7. What is the Department distribution by level (entry, mid, senior)?
select department,
	experience_level,
	count(*) as Employees_count
from salaries
group by 1,2
order by 3 desc;

-- Q8 What is the average salary progression from entry-level to senior-level positions?
select experience_level,
	cast(avg(Salary_in_usd)as unsigned) as avg_salary
from salaries
group by 1
order by 2 desc;

-- Q9 What are the most common departments for small, medium, and large companies?
select company_size,
	count(*) as job_count
from salaries
group by 1
order by 2 desc;

-- Q10 How does the employment type (full-time, part-time, freelance) vary by company size?
select company_size,
	employment_type,
	count(*) as employee_count
from salaries
group by 1,2
order by 1,3 desc;

-- Q11 What are the average salaries offered by small, medium, and large companies?
select company_size,
	cast(avg(salary_in_usd) as unsigned) avg_salary
from salaries
group by 1 
order by 2 desc;
