class WorkoutBlocksController < ApplicationController
    def index
        workout_blocks = WorkoutBlock.all
        render json: workout_blocks
    end

    def create
        workout_block = WorkoutBlock.create(workout_block_params)
        render json: workout_block
    end

    private

    def workout_block_params
        params.permit(:block_id, :workout_id)
    end
end
