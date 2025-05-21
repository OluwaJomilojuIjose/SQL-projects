-- Most optimal skills to learn based on high demand and high salaries


    SELECT 
        skills_dim.skills AS skill_name,
        ROUND(AVG(jobs.salary_year_avg),0) AS salary,
        COUNT(skills.skill_id) AS demand

    FROM
        skills_job_dim AS skills
        INNER JOIN skills_dim ON skills.skill_id = skills_dim.skill_id
        INNER JOIN job_postings_fact AS jobs ON skills.job_id = jobs.job_id

    WHERE
        jobs.job_title_short = 'Data Analyst' AND
        jobs.salary_year_avg IS NOT NULL AND
        jobs.job_work_from_home = True
    GROUP BY
    skill_name

    ORDER BY
    salary DESC,
    demand DESC
    