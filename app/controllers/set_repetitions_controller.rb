class SetRepetitionsController < ApplicationController
    def index
        set_repetitions = SetRepetition.all
        render json: set_repetitions
    end

    def create
        # set_repetition = SetRepetition.create(set_repetition_params)
        # render json: set_repetition

        # loop through array of SetRepetition objects and create SetRepetition
        set_repetitions = set_repetition_params[:object_array].map do | set_repetition_object |
            SetRepetition.create(set_repetition_object)
        end
        # debugger
        render json: set_repetitions
    end

    private

    def set_repetition_params
        # params.permit(:block_id, :exercise_set_id)
        params.require(:set_repetition).permit(object_array: [:block_id, :exercise_set_id])
    end
end
