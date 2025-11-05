SELECT CONCAT(Name,'(' , LEFT(occupation,1),')') AS a 
FROM OCCUPATIONS

UNION

SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's','.') AS a
FROM OCCUPATIONS
GROUP BY occupation
ORDER BY a;


/*
Sample Output:

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.

*/

