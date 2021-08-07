class ExerciseSetsController < ApplicationController
    def index
        exercise_sets = ExerciseSet.order_by_id
        render json: exercise_sets
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

    private

    def exercise_set_params
        # params.permit(:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time) # :exercise_id, :set_rep
        # params.permit(:exercise_set_objects_array)
        # params.permit(exercise_set_objects_array: [:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time])
        params.require(:exercise_set).permit(object_array: [:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time])
    end
end
