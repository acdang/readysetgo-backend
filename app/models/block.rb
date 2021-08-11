class Block < ApplicationRecord
    has_many :set_repetitions
    has_many :workout_blocks
    has_many :exercise_sets, through: :set_repetitions
    has_many :workouts, through: :workout_blocks

    def self.delete_block(block_id)
        selected_block = self.find_by(id: block_id)

        # delete associated ExerciseSets
        exercise_sets = selected_block.exercise_sets
        exercise_sets.delete_all

        # delete associated SetRepetitions
        set_repetitions = SetRepetition.where("block_id = '#{block_id}'")
        set_repetitions.delete_all

        # delete associated WorkoutBlocks
        workout_blocks = WorkoutBlock.where("block_id = '#{block_id}'")
        workout_blocks.delete_all

        # delete Block
        selected_block.delete
    end
end
