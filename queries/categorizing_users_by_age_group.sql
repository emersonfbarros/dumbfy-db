SELECT 
    CASE
        WHEN u.age <= 30 THEN 'Up to 30 years'
        WHEN u.age > 30 AND u.age <= 60 THEN 'Between 31 and 60 years old'
        ELSE 'Over 60 years old'
    END AS age_group,
    COUNT(DISTINCT u.id) AS total_users,
    COUNT(fs.song_id) AS total_likes
FROM
    dumbfy.user AS u
        LEFT JOIN
    dumbfy.fav_songs AS fs ON fs.user_id = u.id
GROUP BY age_group
ORDER BY CASE age_group
    WHEN 'Up to 30 years' THEN 1
    WHEN 'Between 31 and 60 years old' THEN 2
    ELSE 3
END;
