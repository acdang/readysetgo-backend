class Workout < ApplicationRecord
    has_many :workout_blocks
    has_many :blocks, through: :workout_blocks

    # accepts_nested_attributes_for :blocks
end
