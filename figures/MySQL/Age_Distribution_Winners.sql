SELECT 
    CASE 
        WHEN winner_age < 20 THEN 'Under 20'
        WHEN winner_age BETWEEN 20 AND 25 THEN '20-25'
        WHEN winner_age BETWEEN 26 AND 30 THEN '26-30'
        WHEN winner_age BETWEEN 31 AND 35 THEN '31-35'
        ELSE 'Over 35'
    END AS age_group,
    COUNT(*) AS winner_count
FROM 
    atp_matches
GROUP BY 
    age_group
ORDER BY 
    CASE age_group
        WHEN 'Under 20' THEN 1
        WHEN '20-25' THEN 2
        WHEN '26-30' THEN 3
        WHEN '31-35' THEN 4
        ELSE 5
    END;