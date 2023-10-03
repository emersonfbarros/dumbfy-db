SELECT 
    ar.name AS artist, al.title AS album
FROM
    dumbfy.album AS al
        INNER JOIN
    dumbfy.artist AS ar ON ar.id = al.artist_id
GROUP BY al.id
HAVING ar.name = 'Elis Regina'
ORDER BY al.title;
