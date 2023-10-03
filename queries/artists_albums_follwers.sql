SELECT 
    ar.name AS artist,
    al.title AS album,
    COUNT(fa.user_id) AS followers
FROM
    dumbfy.album AS al
        INNER JOIN
    dumbfy.artist AS ar ON ar.id = al.artist_id
        INNER JOIN
    dumbfy.followed_artists AS fa ON al.artist_id = fa.artist_id
GROUP BY al.id
ORDER BY followers DESC , ar.name , al.title;
