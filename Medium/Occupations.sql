SELECT
    MAX(CASE WHEN occupation = 'Doctor' THEN name ELSE NULL END),
    MAX(CASE WHEN occupation = 'Professor' THEN name ELSE NULL END),
    MAX(CASE WHEN occupation = 'Singer' THEN name ELSE NULL END),
    MAX(CASE WHEN occupation = 'Actor' THEN name ELSE NULL END)
FROM
    (SELECT
        name,
        occupation,
        ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS row_num
    FROM
        OCCUPATIONS) AS sub
GROUP BY
    row_num
ORDER BY
    row_num;
