class Gamer < ActiveRecord::Base
  has_many :consoles_gamers
  has_many :items
end