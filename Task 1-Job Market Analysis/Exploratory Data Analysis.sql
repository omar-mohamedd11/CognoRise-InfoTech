-- ---------- Busines Questions -------------------
-- Q1. what department had the highest average salry ?
SELECT department, CAST(AVG(salary_in_usd) AS unsigned) as Average_Salary
FROM salaries
GROUP BY 1
ORDER BY 2 DESC;
	
-- Q2. what countries had the highest number of workers ?
select company_location , count(company_location) as Workers_count
from salaries
group by 1
order by 2 desc;

-- Q3. what job positions had the highest salaries ? (Top 5)
select job_title, cast(avg(salary_in_usd) as unsigned) as Salary
from salaries
group by 1
order by 2 desc
limit 5;

-- Q4. what countries had the most large enterprise companies ?
select company_location , count(company_size) as Company_count
from salaries
where company_size = 'Large Enterprise'
group by 1
order by 2 desc;

-- Q5. which job type had more workers remote,hybrid, and on site ?
select job_type ,count(job_type) as workers
from salaries
group by 1
order by 2 desc;

-- Q6. the Average Salary of each Job Type
select job_type , cast(avg(salary_in_usd) as unsigned) as Salary
from salaries
group by 1
order by 2 desc;

-- Q7. The Lowest, Highest and the average Salary of each Experience Level
select experience_level,
max(salary_in_usd) as Highest_Salary,
cast(avg(salary_in_usd) as unsigned) as Average_salary,
min(salary_in_usd) as Lowest_salary
from salaries
group by 1
order by 2 desc