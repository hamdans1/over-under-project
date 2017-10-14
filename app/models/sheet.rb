class Sheet < ActiveRecord::Base
  belongs_to :user
  has_one :league
  has_many :teams, through: :league
end
