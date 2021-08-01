--# Query to select games where 
select * from match where ((home_team_api_id = 8650) or (away_team_api_id = 10260))

--# Query all match dates between MUN and LIV
select date "game-date" from match where (home_team_api_id in (8650, 10260) and away_team_api_id in (8650, 10260)) order by home_team_api_id

--# Query all LIV match data vs all contendors
select * from match where home_team_api_id = 8650;

--# Query home player roster when MUN was home against LIV
select date "game-date",home_player_1 "goalie", home_player_2, home_player_3, 
       home_player_4,home_player_5,home_player_6,
	   home_player_7,home_player_8,home_player_9,
	   home_player_10,home_player_11 
	   from match where ((home_team_api_id = 10260) and (away_team_api_id = 8650))
	   order by home_team_api_id;

--# Select all game dates where MUN was the home team vs LIV
select date "game-date" from match where ((home_team_api_id = 10260) and (away_team_api_id = 8650))

--# Select all game dates where LIV was the home team vs MUN
select date "game-date" from match where ((home_team_api_id = 8650) and (away_team_api_id = 10260))

--# query temp table result and join vs player_attributes
select * from livvman 
left join player_attributes on livvman.player_api_id = player_attributes.player_api_id

--# Drop temp results if exist
drop table if exists manvliv;
drop table if exists livvman;

--# Select home player roster for Liverpool vs MUN
select distinct p.player_name, p.player_api_id, m.home_team_api_id 
      into temporary table manvliv
      from player p, match m 
      where ((p.player_api_id = m.home_player_1) 
	  or (p.player_api_id = m.home_player_2)
	  or (p.player_api_id = m.home_player_3)
	  or (p.player_api_id = m.home_player_4)
	  or (p.player_api_id = m.home_player_5)
	  or (p.player_api_id = m.home_player_6)
	  or (p.player_api_id = m.home_player_7)
	  or (p.player_api_id = m.home_player_8)
	  or (p.player_api_id = m.home_player_9)
	  or (p.player_api_id = m.home_player_10)
	  or (p.player_api_id = m.home_player_11))
	  and ((m.home_team_api_id = 8650) and (away_team_api_id = 10260));	  

--# Select away player roster for when Liverpool played at MUN
drop table if exists manvliv;
select distinct p.player_name, p.player_api_id, m.away_team_api_id 
      into temporary table manvliv
      from player p, match m 
      where ((p.player_api_id = m.away_player_1) 
	  or (p.player_api_id = m.away_player_2)
	  or (p.player_api_id = m.away_player_3)
	  or (p.player_api_id = m.away_player_4)
	  or (p.player_api_id = m.away_player_5)
	  or (p.player_api_id = m.away_player_6)
	  or (p.player_api_id = m.away_player_7)
	  or (p.player_api_id = m.away_player_8)
	  or (p.player_api_id = m.away_player_9)
	  or (p.player_api_id = m.away_player_10)
	  or (p.player_api_id = m.away_player_11))
	  and ((m.away_team_api_id = 8650) and (home_team_api_id = 10260));	

--# Select home player roster when MUN was home vs Liverpool
select distinct p.player_name, p.player_api_id, m.home_team_api_id 
      into table livvman
      from player p, match m 
      where ((p.player_api_id = m.home_player_1) 
	  or (p.player_api_id = m.home_player_2)
	  or (p.player_api_id = m.home_player_3)
	  or (p.player_api_id = m.home_player_4)
	  or (p.player_api_id = m.home_player_5)
	  or (p.player_api_id = m.home_player_6)
	  or (p.player_api_id = m.home_player_7)
	  or (p.player_api_id = m.home_player_8)
	  or (p.player_api_id = m.home_player_9)
	  or (p.player_api_id = m.home_player_10)
	  or (p.player_api_id = m.home_player_11))
	  and ((m.home_team_api_id = 10260) and (away_team_api_id = 8650));	    	  

--# select all match data of games between Manchester United and Liverpool
SELECT id, date "game-date", home_team_api_id "home", away_team_api_id "away", home_player_1, 
    home_player_2, home_player_3, home_player_4, home_player_5, 
    home_player_6, home_player_7, home_player_8, home_player_9, 
    home_player_10, home_player_11, away_player_1, away_player_2, 
    away_player_3, away_player_4, away_player_5, away_player_6, 
    away_player_7, away_player_8, away_player_9, away_player_10, 
    away_player_11 
FROM Match where (((home_team_api_id = 10260) and (away_team_api_id = 8650)) or ((home_team_api_id = 8650) and (away_team_api_id = 10260)))
ORDER BY date;

--# Select all the Liverpool players when they played At Manchester United
select away_player_1, away_player_2, away_player_3, 
       away_player_4,away_player_5,away_player_6,
	   away_player_7,away_player_8,away_player_9,
	   away_player_10,away_player_11 
	   from match where ((home_team_api_id = 10260) and (away_team_api_id = 8650));	   

--# select home players from Liverpool when they hosted Manchester United
select p.player_name "name", m.home_team_api_id, m.home_player_1, m.home_player_2, m.home_player_3, 
       m.home_player_4,m.home_player_5,m.home_player_6,
	   m.home_player_7,m.home_player_8,m.home_player_9,
	   m.home_player_10,m.home_player_11 
	   from match m, player p where ((home_team_api_id = 8650) and (away_team_api_id = 10260));	
	   
--# select home players from Manchester United when they hosted Liverpool	   
select p.player_name "name", m.home_team_api_id, m.home_player_1, m.home_player_2, m.home_player_3, 
       m.home_player_4,m.home_player_5,m.home_player_6,
	   m.home_player_7,m.home_player_8,m.home_player_9,
	   m.home_player_10,m.home_player_11 
	   from match m, player p where ((home_team_api_id = 10260) and (away_team_api_id = 8650));	
	   
