class Player < ApplicationRecord
  has_many :scores, dependent: :destroy

  validates :name, presence: true


  def self.in_range(start_date, end_date)
    joins(:scores).where('scores.started_playing' => start_date..end_date).order_by_score
  end

  def self.order_by_score
    order("scores.score ASC")
  end
end
