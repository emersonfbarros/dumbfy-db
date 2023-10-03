SELECT 
    s.name AS song, COUNT(sp.song_id) AS plays
FROM
    dumbfy.users_playback_history AS uph
        INNER JOIN
    dumbfy.song AS s ON s.id = uph.song_id
GROUP BY uph.song_id, `name`
ORDER BY plays DESC, name
LIMIT 2;
