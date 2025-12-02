


WITH Top_paying_jobs AS (
        SELECT 
        J.job_id,
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
    LIMIT 10
)

SELECT t.*, sk.skills
FROM Top_paying_jobs AS T
INNER JOIN skills_job_dim s ON T.job_id = s.job_id
INNER JOIN skills_dim sk ON s.skill_id = sk.skill_id
ORDER BY
    T.salary_year_avg DESC;




WITH Top_paying_jobs AS (
    SELECT 
        J.job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        c.name AS company_name
    FROM 
        job_postings_fact j
    LEFT JOIN company_dim c ON j.company_id = c.company_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL 
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    t.*,
    STRING_AGG(sk.skills, ', ') AS required_skills
FROM Top_paying_jobs t
JOIN skills_job_dim sjd ON t.job_id = sjd.job_id
JOIN skills_dim sk ON sjd.skill_id = sk.skill_id
GROUP BY t.job_id, t.job_title, t.job_location, t.job_schedule_type,
         t.salary_year_avg, t.job_posted_date, t.company_name
ORDER BY t.salary_year_avg DESC;

