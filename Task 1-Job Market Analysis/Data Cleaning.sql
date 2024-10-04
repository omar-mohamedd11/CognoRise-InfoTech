-- 1.Data Cleaning

-- checking for duplicates

select distinct *
from salaries;

-- Removing Unnecessary Data

alter table salaries
drop column salary,
drop column salary_currency;

-- 2. Renaming Data for better analysis

-- renaming the experience level for better visuals

select experience_level
from salaries
group by experience_level;

update salaries
set experience_level = case 
    when experience_level = 'SE' then 'Senior'
    when experience_level = 'EN' then 'Junior'
    when experience_level = 'EX' then 'Senior'
    when experience_level = 'MI' then 'mid-level'
end
    ;
    
-- renaming the employment type for better visuals
-- fixing uncorrectly typed words    

select employment_type
from salaries;

update salaries
set employment_type = case
	when employment_type = 'FT' then 'full time'
    when employment_type = 'CT' then 'contract'
    when employment_type = 'PT' then 'part time'
    when employment_type = 'FL' then 'full time'
end
;

-- renaming the same jobs into one name
 
select distinct job_title
from salaries
order by 1 ;

update salaries
set job_title = case
	when job_title = 'Finance Data Analyst' then 'Financial Data Analyst'
    when job_title = 'ML Engineer' then 'Machine Learning Engineer'
    else job_title
end;

-- -------------------------------------------------------
-- Renaming the Country codes to the full country name for better visuals 

select distinct employee_residence
from salaries;

update salaries
set employee_residence = case
	when employee_residence ='DE' then 'Germany'
    when employee_residence = 'JP' then 'Japan'
    when employee_residence = 'GB' then 'United Kingdom'
    when employee_residence = 'HN' then 'Honduras'
    when employee_residence = 'US' then 'USA'
    when employee_residence = 'HU' then 'Hungary'
    when employee_residence = 'NZ' then 'New Zealand'
    when employee_residence = 'FR' then 'France'
    when employee_residence = 'IN' then 'India'
    when employee_residence = 'PK' then 'Pakistan'
    when employee_residence = 'PL' then 'Poland'
    when employee_residence = 'PT' then 'Portugal'
    when employee_residence = 'CN' then 'China'
    when employee_residence = 'GR' then 'Greece'
    when employee_residence = 'AE' then 'UAE'
    when employee_residence = 'NL' then 'Netherlands'
    WHEN employee_residence = 'MX' THEN 'Mexico'
    WHEN employee_residence = 'CA' THEN 'Canada'
    WHEN employee_residence = 'AT' THEN 'Austria'
    WHEN employee_residence = 'NG' THEN 'Nigeria'
    WHEN employee_residence = 'PH' THEN 'Philippines'
    WHEN employee_residence = 'ES' THEN 'Spain'
    WHEN employee_residence = 'DK' THEN 'Denmark'
    WHEN employee_residence = 'RU' THEN 'Russia'
    WHEN employee_residence = 'IT' THEN 'Italy'
    WHEN employee_residence = 'HR' THEN 'Croatia'
    WHEN employee_residence = 'BG' THEN 'Bulgaria'
    WHEN employee_residence = 'SG' THEN 'Singapore'
    WHEN employee_residence = 'BR' THEN 'Brazil'
    WHEN employee_residence = 'IQ' THEN 'Iraq'
    WHEN employee_residence = 'VN' THEN 'Vietnam'
    WHEN employee_residence = 'BE' THEN 'Belgium'
    WHEN employee_residence = 'UA' THEN 'Ukraine'
    WHEN employee_residence = 'MT' THEN 'Malta'
    WHEN employee_residence = 'CL' THEN 'Chile'
    WHEN employee_residence = 'RO' THEN 'Romania'
    WHEN employee_residence = 'IR' THEN 'Iran'
    WHEN employee_residence = 'CO' THEN 'Colombia'
    WHEN employee_residence = 'MD' THEN 'Moldova'
    WHEN employee_residence = 'KE' THEN 'Kenya'
    WHEN employee_residence = 'SI' THEN 'Slovenia'
    WHEN employee_residence = 'HK' THEN 'Hong Kong'
    WHEN employee_residence = 'TR' THEN 'Turkey'
    WHEN employee_residence = 'RS' THEN 'Serbia'
    WHEN employee_residence = 'PR' THEN 'Puerto Rico'
    WHEN employee_residence = 'LU' THEN 'Luxembourg'
    WHEN employee_residence = 'JE' THEN 'Jersey'
    WHEN employee_residence = 'CZ' THEN 'Czech Republic'
    WHEN employee_residence = 'AR' THEN 'Argentina'
    WHEN employee_residence = 'DZ' THEN 'Algeria'
    WHEN employee_residence = 'TN' THEN 'Tunisia'
    WHEN employee_residence = 'MY' THEN 'Malaysia'
    WHEN employee_residence = 'EE' THEN 'Estonia'
    WHEN employee_residence = 'AU' THEN 'Australia'
    WHEN employee_residence = 'BO' THEN 'Bolivia'
    WHEN employee_residence = 'IE' THEN 'Ireland'
    WHEN employee_residence = 'CH' THEN 'Switzerland'
    ELSE employee_residence
END;

-- ---------------------------------------------
-- replacing the remote ratio to 'Job Type'(remote,on site, hybrid) for better visuals

select distinct Job_type
from salaries;

alter table salaries
change remote_ratio job_type char(10)
;
update salaries
set job_type = case
	when job_type = '0' then 'On Site'
    when job_type = '50' then 'Hybrid'
    when job_type = '100' then 'Remote'
    else job_type
end;

 -- -----------------------------------------------
-- replacing the country codes from company_location to full country codes for better visuals

select distinct company_location
from salaries;

UPDATE salaries
SET company_location = CASE
    WHEN company_location = 'DE' THEN 'Germany'
    WHEN company_location = 'JP' THEN 'Japan'
    WHEN company_location = 'GB' THEN 'United Kingdom'
    WHEN company_location = 'HN' THEN 'Honduras'
    WHEN company_location = 'US' THEN 'USA'
    WHEN company_location = 'HU' THEN 'Hungary'
    WHEN company_location = 'NZ' THEN 'New Zealand'
    WHEN company_location = 'FR' THEN 'France'
    WHEN company_location = 'IN' THEN 'India'
    WHEN company_location = 'PK' THEN 'Pakistan'
    WHEN company_location = 'PL' THEN 'Poland'
    WHEN company_location = 'PT' THEN 'Portugal'
    WHEN company_location = 'CN' THEN 'China'
    WHEN company_location = 'GR' THEN 'Greece'
    WHEN company_location = 'AE' THEN 'UAE'
    WHEN company_location = 'NL' THEN 'Netherlands'
    WHEN company_location = 'MX' THEN 'Mexico'
    WHEN company_location = 'CA' THEN 'Canada'
    WHEN company_location = 'AT' THEN 'Austria'
    WHEN company_location = 'NG' THEN 'Nigeria'
    WHEN company_location = 'PH' THEN 'Philippines'
    WHEN company_location = 'ES' THEN 'Spain'
    WHEN company_location = 'DK' THEN 'Denmark'
    WHEN company_location = 'RU' THEN 'Russia'
    WHEN company_location = 'IT' THEN 'Italy'
    WHEN company_location = 'HR' THEN 'Croatia'
    WHEN company_location = 'BG' THEN 'Bulgaria'
    WHEN company_location = 'SG' THEN 'Singapore'
    WHEN company_location = 'BR' THEN 'Brazil'
    WHEN company_location = 'IQ' THEN 'Iraq'
    WHEN company_location = 'VN' THEN 'Vietnam'
    WHEN company_location = 'BE' THEN 'Belgium'
    WHEN company_location = 'UA' THEN 'Ukraine'
    WHEN company_location = 'MT' THEN 'Malta'
    WHEN company_location = 'CL' THEN 'Chile'
    WHEN company_location = 'RO' THEN 'Romania'
    WHEN company_location = 'IR' THEN 'Iran'
    WHEN company_location = 'CO' THEN 'Colombia'
    WHEN company_location = 'MD' THEN 'Moldova'
    WHEN company_location = 'KE' THEN 'Kenya'
    WHEN company_location = 'SI' THEN 'Slovenia'
    WHEN company_location = 'HK' THEN 'Hong Kong'
    WHEN company_location = 'TR' THEN 'Turkey'
    WHEN company_location = 'RS' THEN 'Serbia'
    WHEN company_location = 'PR' THEN 'Puerto Rico'
    WHEN company_location = 'LU' THEN 'Luxembourg'
    WHEN company_location = 'JE' THEN 'Jersey'
    WHEN company_location = 'CZ' THEN 'Czech Republic'
    WHEN company_location = 'AR' THEN 'Argentina'
    WHEN company_location = 'DZ' THEN 'Algeria'
    WHEN company_location = 'TN' THEN 'Tunisia'
    WHEN company_location = 'MY' THEN 'Malaysia'
    WHEN company_location = 'EE' THEN 'Estonia'
    WHEN company_location = 'AU' THEN 'Australia'
    WHEN company_location = 'BO' THEN 'Bolivia'
    WHEN company_location = 'IE' THEN 'Ireland'
    WHEN company_location = 'CH' THEN 'Switzerland'
    ELSE company_location
END;

-- -----------------------------------------------------------------
-- renaming company_size with more professional Vocab

select distinct company_size
from salaries;

update salaries
set company_size = case
	when company_size = 'S' then 'Small Enterprise'
    when company_size = 'M' then 'Medium Enterprise'
    when company_size = 'L' then 'Large Enterprise'
end;

-- ------------------------------
-- Adding Department Column

ALTER TABLE salaries
ADD COLUMN department char(40);

alter table salaries
modify department char(40) after job_title ;

update salaries
set department = case 
    when job_title like '%scientist%' or 
         job_title like '%science%' then 'Data Science'
    when job_title like '%ai%' or 
         job_title like '%machine learning%' or 
         job_title like '%nlp%' then 'Artificial Intelligence'
    when job_title like '%analyst%' or 
         job_title like '%analytics%' or
         job_title like '%specialist%' then 'Data Analysis'
    when job_title like '%engineer%' or
         job_title like '%engineering%' or 
         job_title like '%etl%' or
         job_title like '%head of data%' or
         job_title like '%big data%' then 'Data Engineering'
    when job_title like '%architect%' then 'Data Architecture'
    when job_title like '%computer vision%' then 'Computer Vision'
    when job_title like '%bi%' then 'Business Intelligence'
    else 'Other'
end;

-- -------------------------------------
-- 3.formating the columns correctly
-- formatting the work_year column to year not int

alter table salaries
modify work_year year;

;
alter table salaries
modify id int,
modify experience_level char(10),
modify employment_type char(10),
modify job_title char(40),
modify Salary_in_usd int,
modify employee_residence char(20),
modify job_type char(10),
modify company_location char(20),
modify company_size char(20);

-- ---------------------------------------

-- final showcase

select * 
from salaries