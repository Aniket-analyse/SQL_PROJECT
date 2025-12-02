
SELECT 
    sk.skills,
    COUNT(sk.skills) AS skill_count
FROM job_postings_fact j
INNER JOIN skills_job_dim sjd ON j.job_id = sjd.job_id
INNER JOIN skills_dim sk ON sjd.skill_id = sk.skill_id
WHERE job_title_short = 'Data Analyst' AND job_country = 'United States'
GROUP BY sk.skills
ORDER BY skill_count DESC
LIMIT 5;
