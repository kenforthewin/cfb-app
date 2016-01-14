class GamesController < ApplicationController
  def show
    @game, @home_team, @away_team = Game.game_data(params[:id])
  end
end
