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
        # debugger
        # exercise_set = ExerciseSet.create(exercise_set_params)
        render json: exercise_sets
    end

    def destroy # MAYBE MAYBE ALL THIS A CUSTOM METHOD???
        selected_set = ExerciseSet.find_by(id: params[:id])

        # delete associated SetRepetitions
        set_repetitions = SetRepetition.where("exercise_set_id = '#{params[:id]}'")
        set_repetitions.delete_all

        # delete Set
        selected_set.delete

        # render JSON message
        render json: { message: "The exercise set has been deleted" }
    end

    private

    def exercise_set_params
        # params.permit(:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time) # :exercise_id, :set_rep
        # params.permit(:exercise_set_objects_array)
        # params.permit(exercise_set_objects_array: [:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time])
        params.require(:exercise_set).permit(object_array: [:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time])
    end
end
