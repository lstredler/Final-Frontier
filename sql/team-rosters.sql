#
# Queries to pull the home team rosters for MAN (10260) vs LIV(8650)
#

select distinct p.player_name, p.player_api_id, m.home_team_api_id from player p, match m 
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
	  and ((m.home_team_api_id = 8650) and (away_team_api_id = 10260))

select distinct p.player_name, p.player_api_id, m.home_team_api_id from player p, match m 
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
	  and ((m.home_team_api_id = 10260) and (away_team_api_id = 8650))
