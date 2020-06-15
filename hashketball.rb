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

# Write code here
def num_points_scored(player)
  game_hash[:home][:players].each {|x,y|
    if x[:player_name] == player 
      return x[:points]
    end
  }
  game_hash[:away][:players].each {|x,y|
    if x[:player_name] == player 
      return x[:points]
    end   
  }
end

def shoe_size(player)
  game_hash[:home][:players].each {|x,y|
    if x[:player_name] == player 
      return x[:shoe]
    end
  }
  game_hash[:away][:players].each {|x,y|
    if x[:player_name] == player 
      return x[:shoe]
    end   
  }
end

def team_colors(team)
  if game_hash[:home][:team_name] == team 
    return game_hash[:home][:colors]
  end
  game_hash[:away][:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team) 
  numbers = []
  if game_hash[:home][:team_name] == team 
    game_hash[:home][:players].each {|x,y|
      numbers << x[:number]
    }
    return numbers
  end
  game_hash[:away][:players].each {|x,y|
      numbers << x[:number]
  }
  #numbers
  max_steals
end 

def player_stats(player)
  game_hash.each{|x,y|
    y[:players].each{|x,y|
      if x[:player_name] == player
        return x
      end
    }
  }
end

def big_shoe_rebounds
  game_hash.each{|x,y|
      y[:players].each{|x,y|
        if x[:shoe] == find_max_shoe
          return x[:rebounds]
        end
      }
    }
end

def find_max_shoe
  max_shoe = 0
  game_hash.each{|x,y|
    y[:players].each{|x,y|
      if x[:shoe] > max_shoe
        max_shoe = x[:shoe]
      end
    }
  }
  max_shoe
end

def most_points_scored
  max_points = 0
  game_hash.each{|x,y|
    y[:players].each{|x,y|
      if x[:points] > max_points
        max_points = x[:points]
      end
    }
  }
  max_points
end

def winning_team 
  home_points = 0 
  away_points = 0 
  game_hash[:home][:players].each{|x,y|
    home_points += x[:points]
  }
  game_hash[:away][:players].each{|x,y|
    away_points += x[:points]
  }
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  max_name_length = 0
  max_name = ""
  game_hash.each{|x,y|
    y[:players].each{|x,y|
      if x[:player_name].length > max_name_length
        max_name = x[:player_name]
        max_name_length = x[:player_name].length
      end
    }
  }
  max_name
end

def most_steals 
  max_steals = 0
  game_hash.each{|x,y|
    y[:players].each{|x,y|
      if x[:steals] > max_steals
        max_steals = x[:steals]
      end
    }
  }
  max_steals
end