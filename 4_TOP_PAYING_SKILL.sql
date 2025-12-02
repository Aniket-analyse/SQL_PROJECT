SELECT 
 	 sk.skills,
   ROUND(AVG(salary_year_avg)) AS salary
FROM job_postings_fact j
INNER JOIN skills_job_dim sjd ON j.job_id = sjd.job_id
INNER JOIN skills_dim sk ON sjd.skill_id = sk.skill_id
WHERE 
	job_title_short = 'Data Analyst' AND 
	salary_year_avg IS NOT NULL AND
	JOB_work_from_home = TRUE
	
GROUP BY sk.skills
ORDER BY salary DESC
LIMIT 30;

 --  Big-data skills like PySpark give the highest-paying remote Data Analyst jobs.

 -- Python tools (Pandas, NumPy, Jupyter) strongly boost salary.

 -- Cloud + DevOps skills (GCP, GitLab) lead to top-tier analyst pay.