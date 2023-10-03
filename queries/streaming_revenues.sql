SELECT 
    MIN(p.plan_price) AS minimum_revenue,
    MAX(p.plan_price) AS maximum_revenue,
    ROUND(AVG(p.plan_price), 2) AS average_revenue,
    RSpotifyCloneOUND(SUM(p.plan_price), 2) AS total_total
FROM
    dumbfy.user AS u INNER JOIN dumbfy.plan AS p ON u.plan_id = p.id;
