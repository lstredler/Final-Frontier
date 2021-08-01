#
# Queries to pull the home team rosters for all MAN (10260) vs LIV(8650) games
# and join on player_attributes
#

drop table if exists livvman;
select distinct p.player_name, p.player_api_id, m.home_team_api_id 
      into temporary table livvman
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

select * from livvman 
left join player_attributes on livvman.player_api_id = player_attributes.player_api_id;

drop table if exists manvliv;
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
	  and ((m.home_team_api_id = 10260) and (away_team_api_id = 8650));

select * from manvliv 
left join player_attributes on manvliv.player_api_id = player_attributes.player_api_id;
