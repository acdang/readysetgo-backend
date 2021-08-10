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

    def reduce_reps
        set_repetitions = SetRepetition.where("exercise_set_id = '#{set_repetition_params[:exercise_set_id]}' and block_id = '#{set_repetition_params[:block_id]}'")
        to_delete = set_repetitions.last(set_repetition_params[:num_to_delete])
        SetRepetition.delete(to_delete)
    end

    private

    def set_repetition_params
        # params.permit(:block_id, :exercise_set_id)
        params.require(:set_repetition).permit(:num_to_delete, :block_id, :exercise_set_id, object_array: [:block_id, :exercise_set_id])
    end
end
