class ConsolesGamer < ActiveRecord::Base
  belongs_to :console
  belongs_to :gamer
end