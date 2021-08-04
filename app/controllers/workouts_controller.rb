class WorkoutsController < ApplicationController
    def create
        workout = Workout.create(workout_params)
    end

    private

    def workout_params
        params.permit(:name)
    end
end
