-- Players with the largest improvement in Ranking
CREATE VIEW players_with_largest_ranking_improvement AS
SELECT 
    p.name_full,
    MAX(r1.`rank`) - MIN(r2.`rank`) AS ranking_improvement
FROM 
    atp_players p
JOIN 
    atp_rankings_current r1 ON p.player_id = r1.player
JOIN 
    atp_rankings_current r2 ON p.player_id = r2.player
WHERE 
    r1.ranking_date < r2.ranking_date
GROUP BY 
    p.name_full
ORDER BY 
    ranking_improvement DESC;