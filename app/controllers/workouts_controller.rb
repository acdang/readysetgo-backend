class WorkoutsController < ApplicationController
    def index
        workouts = Workout.all
        render json: workouts
    end

    #  RENDER THE CARDS WITH SHOW

    def create
        workout = Workout.create(workout_params)
        render json: workout
    end

    def destroy # MAYBE MAYBE ALL THIS A CUSTOM METHOD??? make method for deleteBlock then use that here?
        selected_workout = Workout.find_by(id: params[:id])

        # delete associated ExerciseSets
        all_blocks = selected_workout.blocks
        all_blocks.each { |block| block.exercise_sets.delete_all }

        # delete associated SetRepetitions
        all_blocks.each { |block| SetRepetition.where("block_id = '#{block.id}'").delete_all }

        # delete associated WorkoutBlocks
        all_blocks.each { |block| WorkoutBlock.where("block_id = '#{block.id}'").delete_all }

        # delete Blocks
        all_blocks.delete_all

        # delete Workout
        selected_workout.delete

        # render JSON message
        render json: { message: "The workout has been deleted" }
    end

    private

    def workout_params
        params.permit(:name)
    end
end
