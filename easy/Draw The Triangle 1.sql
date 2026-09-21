-- Draw The Triangle 1

SET @temp := 21;
SELECT REPEAT('* ', @temp := @temp - 1) 
FROM information_schema.tables 
LIMIT 20;
