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

# Create list of users
trey = User.create(name: 'trey', email: 'an.infinite.permutation@gmail.com', password: 'sands', password_confirmation: 'sands')
becky = User.create(name: 'becky', email: 'becky@example.org', password: 'goodhair', password_confirmation: 'goodhair')
jacob = User.create(name: 'jacob', email: 'jacob@example.org', password: 'jdawg', password_confirmation: 'jdawg')
ccook = User.create(name: 'ccook', email: 'ccook@example.org', password: 'omnomnom', password_confirmation: 'omnomnom')

# Create list of games 
agricola = Game.create( title: 'Agricola', cover_url: 'https://cf.geekdo-images.com/images/pic259085_md.jpg', min_age: 12, year: 2007, description: 'In Agricola, you\'re a farmer in a wooden shack with your spouse and little else. On a turn, you get to take only two actions, one for you and one for the spouse, from all the possibilities you\'ll find on a farm: collecting clay, wood, or stone; building fences; and so on. You might think about having kids in order to get more work accomplished, but first you need to expand your house. And what are you going to feed all the little rugrats?\rThe game supports many levels of complexity, mainly through the use (or non-use) of two of its main types of cards, Minor Improvements and Occupations. In the beginner\'s version (called the Family Variant in the U.S. release), these cards are not used at all. For advanced play, the U.S. release includes three levels of both types of cards; Basic (E-deck), Interactive (I-deck), and Complex (K-deck), and the rulebook encourages players to experiment with the various decks and mixtures thereof. Aftermarket decks such as the Z-Deck and the L-Deck also exist.', min_playtime: 30, max_playtime: 150, min_players: 1, max_players: 5, is_expansion: false, base_id: nil)

carcassonne = Game.create(title: 'Carcassonne', cover_url: 'https://cf.geekdo-images.com/images/pic166867_md.jpg', min_age: 8, year: 2000, description: 'Carcassonne is a tile-placement game in which the players draw and place a tile with a piece of southern French landscape on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, etcetera. Having placed a tile, the player can then decide to place one of his meeples on one of the areas on it: on the city as a knight, on the road as a robber, on a cloister as a monk, or on the grass as a farmer. When that area is complete, that meeple scores points for its owner. \r During a game of Carcassonne, players are faced with decisions like: "Is it really worth putting my last meeple there?" or "Should I use this tile to expand my city, or should I place it near my opponent instead, giving him a hard time to complete his project and score points?" Since players place only one tile and have the option to place one meeple on it, turns proceed quickly even if it is a game full of options and possibilities.', min_playtime: 30, max_playtime: 45, min_players: 2, max_players: 5, is_expansion: false, base_id: nil)

carcassonne_exp_1 = Game.create(title: 'Carcassonne: The Ferries', cover_url: 'https://cf.geekdo-images.com/images/pic1949619.jpg', min_age: 8, year: 2012, description: 'Carcassonne: The Ferries, a small expansion for Carcassonne, includes eight new land tiles that show three or four road segments leading to a lake in the center of the tile; these tiles are mixed with the other tiles in the game. \rWhenever a player draws one of these tiles, she or he places it following the normal rules, decides whether to place a follower (and if on a road as a robber, on which segment), then places a ferry on the tile to connect two of the road segments. Any segments not connected by a ferry end in the lake. Whenever a player extends a road that contains one or more ferries – whether by placing a Ferries tile or a regular road tile – she or he may move the first ferry closest to that tile in each direction of the road to connect different road segments. If this movement leads to a road being closed at both ends, that road now scores.', min_playtime: 45, max_playtime: 60, min_players: 2, max_players: 6, is_expansion: true, base_id: carcassonne.id)

# Create list of game sessions
game_one = GameSession.create(game_id: agricola.id, played_on: Date.parse("2016-05-26"))

game_two = GameSession.create(game_id: carcassonne.id, played_on: Date.parse("2016-05-12"))
game_three = GameSession.create(game_id: carcassonne.id, played_on: Date.parse("2016-05-07"))

# Create list of game participants and loop through to create
game_participant_list = [[game_two.id, trey.id, 97, true],
				[game_two.id, becky.id, 88, false],
				[game_two.id, jacob.id, 66, false],
				[game_one.id, jacob.id, 36, false],
				[game_one.id, trey.id, 40, true],
				[game_three.id, ccook.id, 77, false],
				[game_three.id, becky.id, 87, true]]

game_participant_list.each do |game_session_id, user_id, score, did_win|
	GameParticipant.create(game_session_id: game_session_id, user_id: user_id, score: score, did_win: did_win)
end

# Create list of expansions and loop through to create
Expansion.create(base_id: carcassonne.id, expansion_game_id: carcassonne_exp_1.id)


# Create list of collections and loop through to create
collection_list = [[agricola.id, trey.id, Date.parse("2016-01-01"), 10], 
					[agricola.id, becky.id, Date.parse("2016-04-17"), 7],
					[carcassonne.id, trey.id, Date.parse("2016-04-12"), 8],
					[carcassonne_exp_1.id, trey.id, Date.parse("2016-05-11"), 6]]

collection_list.each do |game_id, user_id, date_added, rating|
	Collection.create(game_id: game_id, user_id: user_id, date_added: date_added, rating: rating)
end

print "There are now #{Game.count} games in the database.\n"
print "There are now #{Expansion.count} expansions in the database.\n"
print "There are now #{GameSession.count} game sessions in the database.\n"
print "There are now #{Collection.count} games in users' collections in the database.\n"
print "There are now #{User.count} users in the database.\n"