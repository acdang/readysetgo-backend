class Block < ApplicationRecord
    has_many :set_repetitions
    has_many :workout_blocks
    has_many :exercise_sets, through: :set_repetitions
    has_many :workouts, through: :workout_blocks
end
