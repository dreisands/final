class Game < ActiveRecord::Base
	has_many :expansions
	has_many :collections
	has_many :users, :through => :collections
end
