class Team < ActiveRecord::Base
    belongs_to :sheet
    
    validates :players, presence: true
    validates :total, presence: true
    validates :league, presence: true
    validates :coach, presence: true
    validates :name, presence: true
    
end
