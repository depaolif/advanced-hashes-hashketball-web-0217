require "pry"

# Write your code here!
def game_hash
	{
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black","White"],
			:players => {
				"Alan Anderson" => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1
				},
				"Reggie Evans" => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7
				},
				"Brook Lopez" => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15
				},
				"Mason Plumlee" => {
					:number => 1,
					:shoe => 19,
					:points => 26,
					:rebounds => 12,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5
				},
				"Jason Terry" => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1
				}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise","Purple"],
			:players => {
				"Jeff Adrien" => {
					:number => 4,
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2
				},
				"Bismak Biyombo" => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 7,
					:blocks => 15,
					:slam_dunks => 10
				},
				"DeSagna Diop" => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5
				},
				"Ben Gordon" => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0
				},
				"Brendan Haywood" => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 22,
					:blocks => 5,
					:slam_dunks => 12
				}
			}
		}
	}

end



def num_points_scored(player_name)
	game_hash[:home][:players].each do |player, data|
		if player == player_name
			return data[:points]
		end
	end
	game_hash[:away][:players].each do |player, data|
		if player == player_name
			return data[:points]
		end
	end
end

def shoe_size(player_name)
	game_hash[:home][:players].each do |player, data|
		if player == player_name
			return data[:shoe]
		end
	end
	game_hash[:away][:players].each do |player, data|
		if player == player_name
			return data[:shoe]
		end
	end
end

def team_colors(team_name)
	game_hash.each do |loc,team|
		if team[:team_name] == team_name
			return team[:colors]
		end
	end
end

def team_names
	[game_hash[:home][:team_name],game_hash[:away][:team_name]]
end

def player_numbers(team_name)
	if game_hash[:home][:team_name] == team_name
		loc = :home
	elsif game_hash[:away][:team_name] == team_name
		loc = :away
	end

	res = []
	game_hash[loc][:players].each do |player,data|
		res.push(data[:number])
	end
	res
end

def player_stats(player_name)
	game_hash[:home][:players].each do |player, data|
		if player == player_name
			return data
		end
	end
	game_hash[:away][:players].each do |player, data|
		if player == player_name
			return data
		end
	end
end

def big_shoe_rebounds
	biggest_shoe = 0
	biggest_name = ""
	loc = ""
	game_hash[:home][:players].each do |player, data|
		if data[:shoe] > biggest_shoe
			biggest_shoe = data[:shoe]
			biggest_name = player
			loc = :home
		end
	end
	game_hash[:away][:players].each do |player, data|
		if data[:shoe] > biggest_shoe
			biggest_shoe = data[:shoe]
			biggest_name = player
			loc = :away
		end
	end
	game_hash[loc][:players][biggest_name][:rebounds]
end

# ---------*BONUS*---------

def most_points_scored
	players = {}
	game_hash[:home][:players].each do |player, data|
		players[player] = data[:points]
	end
	game_hash[:away][:players].each do |player, data|
		players[player] = data[:points]
	end
	
	best_score = 0
	best_player = ""
	players.each do |player,score|
		if best_score < score
			best_score = score
			best_player = player
		end
	end
	best_player
end

def winning_team
	home_score = 0
	away_score = 0
	game_hash[:home][:players].each do |player, data|
		home_score += data[:points]
	end
	game_hash[:away][:players].each do |player, data|
		away_score += data[:points]
	end
	home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
	players = []
	game_hash[:home][:players].each do |player, data|
		players.push(player)
	end
	game_hash[:away][:players].each do |player, data|
		players.push(player)
	end
	
	longest_name = ""
	longest_name_length = 0
	players.each do |player|
		if player.length > longest_name_length
			longest_name = player
			longest_name_length = player.length
		end
	end
	longest_name
end


