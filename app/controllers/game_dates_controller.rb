class GameDatesController < ApplicationController
  def select
    @game_date = GameDate.new
  end

  def show

    if request.method == 'POST'
      date = params['game_date']['date']
      parsed_date = Date.strptime(date, '%m/%d/%Y')
      formatted_date = parsed_date.strftime('%Y%m%d')
    else
      formatted_date = params[:id].to_s
      parsed_date = Date.strptime(formatted_date, '%Y%m%d')
    end

    @date_format = parsed_date.strftime('%m/%d/%Y')


    @game_date = GameDate.new(date: formatted_date)
    @games = @game_date.date_data

    @games
  end
end
