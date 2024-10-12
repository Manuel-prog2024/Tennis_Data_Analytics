CREATE DATABASE IF NOT EXISTS Tennis_db;
USE Tennis_db;
DROP TABLE IF EXISTS ATP_matches;
DROP TABLE IF EXISTS ATP_players;
DROP TABLE IF EXISTS ATP_rankings_current;


CREATE TABLE ATP_matches (
surface varchar(5),
tourney_level varchar(1),
tourney_date date,
winner_name varchar(50),
winner_hand varchar(1),
winner_ht float,
winner_ioc char(3),
winner_age float,  
loser_name varchar(50),
loser_hand char(1),
loser_ht varchar(45), 
loser_ioc varchar(45),
loser_age varchar(45),
score varchar(45),
best_of varchar(45),
round varchar(4),
minutes float,
w_ace varchar(45),
w_df float,
w_svpt float,
w_1stIn float,
w_1stWon float,
w_2ndWon float,
w_SvGms float,
w_bpSaved float,
w_bpFaced float,
l_ace float,
l_df float,
l_svpt float,
l_1stIn float,
l_1stWon float,
l_2ndWon float,
l_SvGms float,
l_bpSaved float,
l_bpFaced float,
winner_rank float ,
winner_rank_points float,
loser_rank float,
loser_rank_points float

);

CREATE TABLE ATP_players (
player_id char(6),
name_full varchar(25),
hand char(1),
dob date,
ioc char(3),
height float,
wikidata_id varchar(10),
PRIMARY KEY (player_id)
);

CREATE TABLE ATP_rankings_current (
`rank` varchar(4), -- rank is a reserved keword in SQL, please enclose it in backticks. 
ranking_date date,
points int,
player varchar(20), 
FOREIGN KEY (player) REFERENCES ATP_players(player_id)
);

use Tennis_db;
select winner_name, loser_name, minutes from Tennis_db.ATP_matches limit 20;
