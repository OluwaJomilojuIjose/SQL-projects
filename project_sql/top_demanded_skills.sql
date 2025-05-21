


WITH top_ten AS (
SELECT
    company.name,
    jobs.job_id,
    jobs.job_title,
    jobs.job_location,
    jobs.job_schedule_type,
    jobs.salary_year_avg,
    jobs.job_posted_date
    

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
    skills.skill_id,
    skills_dim.skills AS skill_name,
    COUNT (skills.skill_id) AS skill_count

FROM
    skills_job_dim AS skills
    INNER JOIN top_ten ON top_ten.job_id = skills.job_id
    INNER JOIN skills_dim ON skills.skill_id = skills_dim.skill_id

GROUP BY
    skills.skill_id, skill_name

ORDER BY 
    skill_count DESC

LIMIT
5