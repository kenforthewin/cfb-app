# == Schema Information
#
# Table name: game_dates
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameDate < ActiveRecord::Base

  attr_accessor :url, :date


  def date_data
    response = JSON.parse(HTTParty.get("https://cfb-scoreboard-api.herokuapp.com/v1/date/#{date}"))

    games_data = response['games']

    games = []
    games_data.each do |game|
      r_game, r_home_team, r_away_team = Game.new_with_data(game)
      games << {game: r_game, home_team: r_home_team, away_team: r_away_team}
    end

    return games
  end
end
