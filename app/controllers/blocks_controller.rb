class BlocksController < ApplicationController
    def index
        blocks = Block.all
        render json: blocks
    end

    def show
        block = Block.find_by(id: params[:id])
        render json: block
    end

    def create
        block = Block.create(block_params)
        render json: block
    end

    def destroy # MAYBE MAYBE ALL THIS A CUSTOM METHOD???
        selected_block = Block.find_by(id: params[:id])

        # delete associated ExerciseSets
        exercise_sets = selected_block.exercise_sets
        exercise_sets.delete_all

        # delete associated SetRepetitions
        set_repetitions = SetRepetition.where("block_id = '#{params[:id]}'")
        set_repetitions.delete_all

        # delete associated WorkoutBlocks
        workout_blocks = WorkoutBlock.where("block_id = '#{params[:id]}'")
        workout_blocks.delete_all

        # delete Block
        selected_block.delete

        # render JSON message
        render json: { message: "The exercise block and its sets have been deleted" }
    end

    private

    def block_params
        params.permit(:name)
    end
end
