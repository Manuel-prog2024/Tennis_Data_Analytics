-- Average ranking of players at different tournaments
SELECT 
    p.name_full,
    AVG(CASE WHEN m.tourney_name = 'Australian Open' THEN r.`rank` END) AS australian_open_rank,
    AVG(CASE WHEN m.tourney_name = 'Roland Garros' THEN r.`rank` END) AS french_open_rank,
    AVG(CASE WHEN m.tourney_name = 'Wimbledon' THEN r.`rank` END) AS wimbledon_rank,
    AVG(CASE WHEN m.tourney_name = 'US Open' THEN r.`rank` END) AS us_open_rank
FROM 
    atp_players p
JOIN 
    atp_matches m ON p.player_id = m.winner_id
JOIN 
    atp_rankings_current r ON p.player_id = r.player
WHERE 
    m.tourney_name IN ('Australian Open', 'Roland Garros', 'Wimbledon', 'US Open')
GROUP BY 
    p.name_full;