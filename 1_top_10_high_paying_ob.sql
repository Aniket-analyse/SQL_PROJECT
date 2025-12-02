
-- what are the top-paying remote data analyst jobs?     
--Top 10 Highest Paying Remote Data Analyst Jobs
-- focus on job postings with specified salaries (remove NULLs)


SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    c.name AS company_name
FROM 
    job_postings_fact j
LEFT JOIN company_dim c ON j.company_id = c.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = TRUE AND 
    salary_year_avg IS NOT NULL 
ORDER BY
     salary_year_avg DESC
 LIMIT 30;