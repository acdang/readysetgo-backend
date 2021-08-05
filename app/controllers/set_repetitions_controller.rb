class SetRepetitionsController < ApplicationController
    def index
        set_repetitions = SetRepetition.all
        render json: set_repetitions
    end

    def create
        set_repetition = SetRepetition.create(set_repetition_params)
        render json: set_repetition
    end

    private

    def set_repetition_params
        params.permit(:block_id, :exercise_set_id)
    end
end
