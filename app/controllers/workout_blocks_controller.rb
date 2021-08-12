class WorkoutBlocksController < ApplicationController
    def index
        workout_blocks = WorkoutBlock.all
        render json: workout_blocks
    end

    def create
        workout_block = WorkoutBlock.create(workout_block_params)
        render json: workout_block
    end

    def remove_instance
        applicable_workout_blocks = WorkoutBlock.where("block_id = '#{workout_block_params[:block_id]}' and workout_id = '#{workout_block_params[:workout_id]}'")
        ordered = applicable_workout_blocks.order("created_at")
        ordered[workout_block_params[:index_to_remove]].delete

        # Delete Block if it has zero associations to a Workout
        check_again = WorkoutBlock.where("block_id = '#{workout_block_params[:block_id]}' and workout_id = '#{workout_block_params[:workout_id]}'")
        if check_again.length == 0
            # block_to_delete = Block.find_by(id: workout_block_params[:block_id])
            # block_to_delete.delete_block
            Block.delete_block(workout_block_params[:block_id])
        end
    end

    private

    def workout_block_params
        params.permit(:block_id, :workout_id, :index_to_remove)
    end
end
