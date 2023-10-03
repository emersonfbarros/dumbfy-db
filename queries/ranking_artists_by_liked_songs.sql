SELECT 
    ar.name AS artist,
    CASE
        WHEN COUNT(fs.user_id) >= 5 THEN 'A'
        WHEN
            COUNT(fs.user_id) >= 3
                AND COUNT(fs.user_id) < 5
        THEN
            'B'
        WHEN
            COUNT(fs.user_id) >= 1
                AND COUNT(fs.user_id) < 3
        THEN
            'C'
        ELSE '-'
    END AS ranking
FROM
    SpotifyClone.artist AS ar
        LEFT JOIN
    SpotifyClone.album AS al ON al.artist_id = ar.id
        LEFT JOIN
    SpotifyClone.song AS s ON s.album_id = al.id
        LEFT JOIN
    SpotifyClone.fav_songs AS fs ON fs.song_id = s.id
GROUP BY ar.id
ORDER BY COUNT(fs.user_id) DESC , ar.name;
