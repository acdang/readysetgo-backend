class BlocksController < ApplicationController
    def index
        blocks = Block.all
        render json: blocks
    end

    def create
        block = Block.create(block_params)
        render json: block
    end

    private

    def block_params
        params.permit(:name) # :workout_id
    end
end
