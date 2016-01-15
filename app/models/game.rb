class Game < ActiveRecord::Base
  include HTTParty
  attr_accessor :season, :date, :attendance, :venue_name, :venue_city, :venue_state, :headline, :winner, :odds_spread, :odds_over_under, :home_score, :away_score

  def self.game_data(id)
    response = JSON.parse(HTTParty.get("https://cfb-scoreboard-api.herokuapp.com/v1/game/#{id}"))

    game_data = response['game']

    return self.new_with_data(game_data)
  end

  def self.new_with_data(game_data)
    game = self.new(date: game_data['date'], season: game_data['season'], home_score: game_data['scores']['home'],
                    away_score: game_data['scores']['away'], winner: game_data['winner'])

    home_team_data = game_data['homeTeam']
    home_team = Team.new(location: home_team_data['location'], name: home_team_data['name'], display_name: home_team_data['displayName'],
                         conference: home_team_data['conference']['name'])
    away_team_data = game_data['awayTeam']
    away_team = Team.new(location: away_team_data['location'], name: away_team_data['name'], display_name: away_team_data['displayName'],
                         conference: away_team_data['conference']['name'])

    return game, home_team, away_team
  end
end
