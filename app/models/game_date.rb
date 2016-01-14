# == Schema Information
#
# Table name: game_dates
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameDate < ActiveRecord::Base

  attr_accessor :url, :venue_name
end
