-- Data Cleaning

-- Standarizing Values
select distinct Marital_Status
from marketing_campaign;

update marketing_campaign
set marital_status = 'Single'
where marital_status = 'Alone';

-- Removing Unwanted Data
DELETE 
FROM marketing_campaign
WHERE Marital_Status IN ('Absurd', 'Yolo')
OR income IS NULL 
OR income = '';

-- Formating Data Correctly
select year(convertt)
from (
	select year_birth,
		cast(concat(year_birth,'-01','-01') as date) convertt
	from marketing_campaign) t1;
    
   update marketing_campaign t1
join (select Year_Birth,
	cast(concat(Year_Birth,'-','01','-','01') as date) yearr
   from marketing_campaign) t2
on t1.Year_Birth = t2.Year_Birth
set t1.Year_Birth = year(t2.yearr);

update marketing_campaign
set Dt_Customer =  str_to_date(Dt_Customer,'%d-%m-%Y');

-- deleting unnecessary columns
alter table marketing_campaign
drop column Z_CostContact,
drop column Z_Revenue;

-- Formating Columns 
alter table marketing_campaign
modify ID int,
modify education varchar(10),
modify marital_status varchar(8),
modify income int,
modify kidhome int,
modify teenhome int,
modify dt_customer date,
modify recency int,
modify mntwines int,
modify mntfruits int,
modify mntmeatproducts int,
modify mntfishproducts int,
modify mntsweetproducts int,
modify mntgoldprods int,
modify numdealspurchases int,
modify numwebpurchases int,
modify numcatalogpurchases int,
modify numstorepurchases int,
modify numwebvisitsmonth int,
modify acceptedcmp1 int,
modify acceptedcmp2 int,
modify acceptedcmp3 int,
modify acceptedcmp4 int,
modify acceptedcmp5 int,
modify response int,
modify complain int;

