class Score < ApplicationRecord
  belongs_to :player, optional: true

  validates :started_playing, :score, :time_spent, presence: true
end
