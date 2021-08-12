class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  has_many :set_repetitions
  has_many :blocks, through: :set_repetitions

  # an ExerciseSet should have either a number of exercise repetitions or an active time
  validates :exercise_rep_num, presence: true, unless: :active_time
  validates :active_time, presence: true, unless: :exercise_rep_num

  def self.order_by_id
    self.all.order('id')
  end
end
