class Gamer < ActiveRecord::Base
  has_many :gamers
  has_many :consoles_gamers
end