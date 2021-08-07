class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  has_many :set_repetitions
  has_many :blocks, through: :set_repetitions

  def self.order_by_id
    self.all.order('id')
  end
end
