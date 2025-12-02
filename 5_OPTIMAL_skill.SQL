SELECT sd.skill_id, 
    UPPER(sd.skills),
    COUNT(sd.skills) AS skill_count,
     ROUND(AVG(jp.salary_year_avg)) AS avg_salary
FROM job_postings_fact AS jp
INNER JOIN skills_job_dim AS sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jp.job_title_short = 'Data Analyst'   
    AND jp.salary_year_avg IS NOT NULL
        AND jp.job_work_from_home = TRUE
GROUP BY
     sd.skill_id,  
    sd.skills
HAVING 
    COUNT(sd.skills) >= 20
ORDER BY 
     avg_salary DESC ,
     skill_count DESC
LIMIT 25;

/*
 Top Remote Data Analyst Skills by Average Salary and Frequency

Cloud & Big-Data tools (Go, Hadoop, Snowflake, Azure, AWS) give the highest-paying Data Analyst roles, all above $108k+.

BI + SQL ecosystem (Looker, Oracle, SQL Server, Power BI, Tableau) offer strong salaries around $97k–104k, showing they’re core for analyst jobs.

Traditional analyst tools (Excel, Sheets, Word, PowerPoint, VBA) have the lowest pay range ($82k–88k), meaning senior/high-paying roles require cloud + modern data stack skills.
 */