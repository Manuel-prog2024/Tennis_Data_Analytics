use tennis_db;
DROP TABLE IF EXISTS atp_players;
DROP TABLE IF EXISTS atp_matches;
-- SHOW TABLES;
-- DESCRIBE atp_players;
-- DESCRIBE atp_matches;
SELECT 
    p.name_full,
    COUNT(*) AS grand_slam_wins
FROM 
    atp_players p
JOIN 
    atp_matches m ON p.player_id = m.winner_id
WHERE 
    m.tourney_level = 'G'
GROUP BY 
    p.name_full
ORDER BY 
    grand_slam_wins DESC;