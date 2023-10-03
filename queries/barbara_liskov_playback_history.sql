SELECT 
    COUNT(uph.song_id) AS playback_history
FROM
    dumbfy.user AS u
        INNER JOIN
    dumbfy.users_playback_history AS uph ON uph.user_id = u.id
WHERE
    u.full_name = 'Barbara Liskov'
GROUP BY u.id;
