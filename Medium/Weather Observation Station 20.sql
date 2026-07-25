// Weather Observation Station 20

SET @rn := -1;
SELECT ROUND(AVG(subq.med), 4) AS median
FROM
(
    SELECT lat_n AS med, (@rn := @rn + 1) AS rn
    FROM station
    ORDER BY lat_n
) AS subq
WHERE
    subq.rn IN (FLOOR(@rn / 2), CEIL(@rn / 2));
