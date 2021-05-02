class Player < ApplicationRecord
  has_many :scores, dependent: :destroy

  validates :name, presence: true


  scope :order_by_score, -> { scores.order(:score => :desc) }


  def self.in_range(start_date, end_date)
    joins(:scores).where('scores.started_playing' => start_date..end_date).order_by_score
  end


  def total_time_played
    scores.sum(:time_spent)
  end

  def score_difference
    values = scores.order(:score => :asc).pluck(:score)
    values.count.eql?(2) ? values[-1] - values[0] : 0
  end

  def number_of_playthroughs
    scores.count
  end
end
