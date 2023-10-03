SELECT 
    al.title AS album, COUNT(fs.user_id) AS likes
FROM
    dumbfy.album AS al
        INNER JOIN
    dumbfy.song AS s ON s.album_id = al.id
        INNER JOIN
    dumbfy.fav_songs AS fs ON fs.song_id = s.id
GROUP BY al.id
ORDER BY likes DESC , al.title
LIMIT 3;
