class ExerciseSetsController < ApplicationController
    def index
        exercise_sets = ExerciseSet.order_by_id
        render json: exercise_sets
    end

    def show
        exercise_set = ExerciseSet.find_by(id: params[:id])
        render json: exercise_set
    end

    def create
        # loop through array of ExerciseSet objects and create ExerciseSet
        exercise_sets = exercise_set_params[:object_array].map do | exercise_object |
            ExerciseSet.create(exercise_object)
        end
        
        render json: exercise_sets
    end

    def update
        exercise_set = ExerciseSet.find_by(id: params[:id])
        exercise_set.update(exercise_set_params)
        render json: exercise_set
    end

    def destroy
        selected_set = ExerciseSet.find_by(id: params[:id])

        # delete associated SetRepetitions
        set_repetitions = selected_set.set_repetitions
        set_repetitions.delete_all

        # delete Set
        selected_set.delete

        # render JSON message
        render json: { message: "The exercise set has been deleted" }
    end

    private

    def exercise_set_params
        params.require(:exercise_set).permit(:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time, object_array: [:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time])
    end
end
