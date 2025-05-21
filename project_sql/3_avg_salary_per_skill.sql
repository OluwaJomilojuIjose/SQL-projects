


WITH top_ten AS (
SELECT *
    

FROM
    job_postings_fact AS jobs
    LEFT JOIN company_dim AS company ON jobs.company_id = company.company_id


WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    

ORDER BY
    salary_year_avg DESC



)

SELECT 
    skills_dim.skills AS skill_name,
    COUNT (skills.skill_id) AS skill_count,
    ROUND(AVG(top_ten.salary_year_avg), 0) AS avg_salary

FROM
    skills_job_dim AS skills
    INNER JOIN top_ten ON top_ten.job_id = skills.job_id
    INNER JOIN skills_dim ON skills.skill_id = skills_dim.skill_id

WHERE
    top_ten.job_location = 'Anywhere'

GROUP BY
     skill_name

ORDER BY 
    avg_salary DESC

