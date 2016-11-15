class Rating < ActiveRecord::Base
    belongs_to :transports
    belongs_to :users
end
