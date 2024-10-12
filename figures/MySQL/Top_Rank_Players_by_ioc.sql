use tennis_db;
DROP TABLE IF EXISTS atp_players;
DROP TABLE IF EXISTS atp_rankings_current;
SHOW TABLES;
DESCRIBE atp_players;
DESCRIBE atp_rankings_current;
CREATE VIEW top_ranked_players_by_country AS
SELECT 
    p.ioc,
    p.name_full,
    r.`rank`
FROM 
    atp_players p
JOIN 
    atp_rankings_current r ON p.player_id = r.player
WHERE 
    p.ioc IS NOT NULL AND r.`rank` IS NOT NULL
ORDER BY 
    r.`rank` ASC;