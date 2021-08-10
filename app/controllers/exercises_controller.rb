class ExercisesController < ApplicationController
    def index
        exercises = Exercise.all
        render json: exercises
    end

    def show 
        exercise = Exercise.find_by(id: params[:id])
        render json: exercise
    end
end
