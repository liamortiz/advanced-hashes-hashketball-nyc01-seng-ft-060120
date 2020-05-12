# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def get_stats(player_name, stat=nil)
  game_hash.each_pair do |parent_key, parent_value|
    parent_value.each_pair do |child_key, child_value|

      if child_key == :players
        child_value.each do |player_object|
          if player_object[:player_name] == player_name
            if !stat
              return player_object
            end
            return player_object[stat]
          end
        end
      end
    end
  end
end

def num_points_scored(player_name)
  get_stats(player_name, :points)
end

def shoe_size(player_name)
  get_stats(player_name, :shoe)
end

def team_colors(team_name)
  sym = game_hash[:home][:team_name] == team_name ? :home : :away
  game_hash[sym][:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  numbers = []
  sym = game_hash[:home][:team_name] == team_name ? :home : :away
  game_hash[sym][:players].each do |player_object|
    player_object.each_pair do |key, value|
      if key == :number
        numbers << value
      end
    end
  end
  numbers
end

def player_stats(player_name)
  get_stats(player_name)
end

def big_shoe_rebounds
  rebounds = 0
  prev_size = 0
  
  [game_hash[:away][:players], game_hash[:home][:players]].flatten.each_with_index do |player_object, index|
    if prev_size < player_object[:shoe]
      prev_size = player_object[:shoe]
      rebounds = player_object[:rebounds]
    end
  end
  rebounds
end

