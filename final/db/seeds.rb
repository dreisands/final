# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Game.delete_all
GameSession.delete_all
GameParticipant.delete_all
Expansion.delete_all
Collection.delete_all

# Create list of users and loop through to create
user_list = [['trey', 'an.infinite.permutation@gmail.com', 'sands', 'sands'],
		['becky', 'becky@example.org', 'goodhair', 'goodhair'],
		['jacob', 'jacob@example.org', 'jdawg', 'jdawg'],
		['ccook', 'ccook@example.org', 'omnomnom', 'omnomnom']]

user_list.each do |name, email, password, password_confirmation|
	User.create(name: name, email: email, password: password, password_confirmation: password_confirmation)
end

# Create list of games and loop through to create
game_list = [['Agricola', 'https://cf.geekdo-images.com/images/pic259085_md.jpg', 12, 2007, 'In Agricola, you\'re a farmer in a wooden shack with your spouse and little else. On a turn, you get to take only two actions, one for you and one for the spouse, from all the possibilities you\'ll find on a farm: collecting clay, wood, or stone; building fences; and so on. You might think about having kids in order to get more work accomplished, but first you need to expand your house. And what are you going to feed all the little rugrats?\rThe game supports many levels of complexity, mainly through the use (or non-use) of two of its main types of cards, Minor Improvements and Occupations. In the beginner\'s version (called the Family Variant in the U.S. release), these cards are not used at all. For advanced play, the U.S. release includes three levels of both types of cards; Basic (E-deck), Interactive (I-deck), and Complex (K-deck), and the rulebook encourages players to experiment with the various decks and mixtures thereof. Aftermarket decks such as the Z-Deck and the L-Deck also exist.', 30, 150, 1, 5],
		['Carcassonne', 'https://cf.geekdo-images.com/images/pic166867_md.jpg', 8, 2000, 'Carcassonne is a tile-placement game in which the players draw and place a tile with a piece of southern French landscape on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, etcetera. Having placed a tile, the player can then decide to place one of his meeples on one of the areas on it: on the city as a knight, on the road as a robber, on a cloister as a monk, or on the grass as a farmer. When that area is complete, that meeple scores points for its owner. \r During a game of Carcassonne, players are faced with decisions like: "Is it really worth putting my last meeple there?" or "Should I use this tile to expand my city, or should I place it near my opponent instead, giving him a hard time to complete his project and score points?" Since players place only one tile and have the option to place one meeple on it, turns proceed quickly even if it is a game full of options and possibilities.', 30, 45, 2, 5]]

game_list.each do |title, cover_url, min_age, year, description, min_playtime, max_playtime, min_players, max_players|
	Game.create(title: title, cover_url: cover_url, min_age: min_age, year: year, description: description, min_playtime: min_playtime, max_playtime: max_playtime, min_players: min_players, max_players: max_players)
end


# Create list of game sessions and loop through to create
game_session_list = [[1, Date.parse("2016-05-26")],
			[2, Date.parse("2016-05-12")],
			[2, Date.parse("2016-05-07")]]

game_session_list.each do |game_id, played_on|
	GameSession.create(game_id: game_id, played_on: played_on)
end

game_participant_list = [[2, 1, 97, true],
				[2, 2, 88, false],
				[2, 3, 66, false],
				[1, 3, 36, false],
				[1, 1, 40, true],
				[3, 4, 77, false],
				[3, 2, 87, true]]

game_participant_list.each do |game_session_id, user_id, score, did_win|
	GameParticipant.create(game_session_id: game_session_id, user_id: user_id, score: score, did_win: did_win)
end

# Create list of expansions and loop through to create
expansion_list = [[2, 'Carcassonne: The Ferries', 'https://cf.geekdo-images.com/images/pic1949619.jpg', 8, 2012, 'Carcassonne: The Ferries, a small expansion for Carcassonne, includes eight new land tiles that show three or four road segments leading to a lake in the center of the tile; these tiles are mixed with the other tiles in the game. \rWhenever a player draws one of these tiles, she or he places it following the normal rules, decides whether to place a follower (and if on a road as a robber, on which segment), then places a ferry on the tile to connect two of the road segments. Any segments not connected by a ferry end in the lake. Whenever a player extends a road that contains one or more ferries – whether by placing a Ferries tile or a regular road tile – she or he may move the first ferry closest to that tile in each direction of the road to connect different road segments. If this movement leads to a road being closed at both ends, that road now scores.', 45, 60, 2, 6]]

expansion_list.each do |game_id, title, cover_url, min_age, year, description, min_playtime, max_playtime, min_players, max_players|
	Expansion.create(game_id: game_id, title: title, cover_url: cover_url, min_age: min_age, year: year, description: description, min_playtime: min_playtime, max_playtime: max_playtime, min_players: min_players, max_players: max_players)
end

# Create list of collections and loop through to create
collection_list = [[1, 1, Date.parse("2016-01-01"), 10, nil], 
					[1, 2, Date.parse("2016-04-17"), 7, nil],
					[2, 1, Date.parse("2016-04-12"), 8, nil],
					[2, 1, Date.parse("2016-05-11"), 6, 1]]

collection_list.each do |game_id, player_id, date_added, rating, expansion_id|
	Collection.create(game_id: game_id, player_id: player_id, date_added: date_added, rating: rating, expansion_id: expansion_id)
end

print "There are now #{Game.count} games in the database.\n"
print "There are now #{Expansion.count} expansions in the database.\n"
print "There are now #{GameSession.count} game sessions in the database.\n"
print "There are now #{Collection.count} games in users' collections in the database.\n"
print "There are now #{User.count} users in the database.\n"