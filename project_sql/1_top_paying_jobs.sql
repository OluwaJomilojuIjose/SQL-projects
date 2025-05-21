/*
-Identify the top 10 highes tpaying Data Analyst roles that are available remotely
-Focus on job postings with specified salaries (remove nulls).
*/


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
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
    

ORDER BY
    salary_year_avg DESC

LIMIT
10

