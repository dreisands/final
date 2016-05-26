class GameSession < ActiveRecord::Base
	has_many :users
end
