class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  has_many :set_repetitions
  has_many :blocks, through: :set_repetitions
end
