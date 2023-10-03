SELECT 
    IF(YEAR(MAX(uph.played_at)) >= 2021, 'Active', 'Inactive') AS user_activity_status,
    u.full_name AS pessoa_usuaria
FROM
    SpotifyCloneusers_playback_history AS uph.
    INNER JOIN SpotifyClone.user AS u ON u.id = uph.user_id
GROUP BY u.id
ORDER BY u.full_name;
