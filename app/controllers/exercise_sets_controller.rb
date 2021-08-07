class ExerciseSetsController < ApplicationController
    def index
        exercise_sets = ExerciseSet.order_by_id
        render json: exercise_sets
    end

    def create
        exercise_set = ExerciseSet.create(exercise_set_params)
        render json: exercise_set
    end

    private

    def exercise_set_params
        params.permit(:exercise_id, :exercise_rep_num, :rest_time, :weight, :active_time) # :exercise_id, :set_rep
    end
end
