// Challenges

WITH Counter AS (
    SELECT 
        h.hacker_id, 
        h.name, 
        COUNT(c.challenge_id) AS total_cnt
    FROM hackers h
    JOIN challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
)
SELECT hacker_id, name, total_cnt
FROM Counter
WHERE total_cnt = (
    -- Keep if the count is equal to the maximum count created by anyone
    SELECT MAX(total_cnt) FROM Counter
)
OR total_cnt IN (
    -- Keep if the count is unique (only 1 hacker achieved this specific count)
    SELECT total_cnt 
    FROM Counter 
    GROUP BY total_cnt 
    HAVING COUNT(*) = 1
)
ORDER BY total_cnt DESC, hacker_id ASC;