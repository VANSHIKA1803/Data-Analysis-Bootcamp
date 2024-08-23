-- Exploratory Data Analysis

-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

-- normally when you start the EDA process you have some idea of what you're looking for

-- with this info we are just going to look around and see what we find!

select * from layoffs_staging2;


-- EASIER QUERIES
select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;


select * from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

-- Looking at Percentage to see how big these layoffs were
SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off IS NOT NULL;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;


select min(`date`), max(`date`)
from layoffs_staging2;


select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;


select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;


select * from layoffs_staging2;

-- Finding single date wise
select `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 2 desc;


-- Finding year date wise
select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;


-- Finding stage wise
select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;


select company, avg(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;


select substring(`date`,1,7) as `Month`, sum(total_laid_off) 
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1 asc;


select * from layoffs_staging2;


with Rolling_Total as
(
select substring(`date`,1,7) as `Month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1 asc
)
select `Month`,total_off, sum(total_off) over (order by `Month`) as rolling_total
from Rolling_Total;


select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;


select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;


-- TOUGHER QUERIES------------------------------------------------------------------------------------------------------------------------------------

-- Earlier we looked at Companies with the most Layoffs. Now let's look at that per year. It's a little more difficult.
-- I want to look at 

with Company_Year(company, years, total_laid_off) as 
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
),
Company_Year_Rank as 
(select *,
dense_rank() over (partition by years order by total_laid_off desc) as Ranking
from Company_Year
where years is not null)
select * 
from Company_Year_Rank
where Ranking <= 5
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;


-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;

-- now use it in a CTE so we can query off of it
WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;

