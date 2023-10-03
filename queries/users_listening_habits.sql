SELECT 
    u.full_name AS pessoa_usuaria,
    COUNT(DISTINCT uph.song_id) AS musicas_ouvidas,
    ROUND(SUM(s.duration_seconds) / 60, 2) AS total_minutos
FROM
    dumbfy.user AS u
        INNER JOIN
    dumbfy.users_playback_history AS uph ON uph.user_id = u.id
        INNER JOIN
    dumbfy.song AS s ON s.id = uph.song_id
GROUP BY u.full_name
ORDER BY u.full_name;
