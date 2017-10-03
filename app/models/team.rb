class Team < ActiveRecord::Base
    
    validates :players, presence: true
    validates :total, presence: true
    validates :league, presence: true
    validates :coach, presence: true
    
end
