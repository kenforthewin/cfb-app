class CreateGameDates < ActiveRecord::Migration
  def change
    create_table :game_dates do |t|

      t.timestamps null: false
    end
  end
end
