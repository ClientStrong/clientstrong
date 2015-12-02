module Api
module V1

class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all

    respond_to do |format|
      format.json  { render :json => @workouts.to_json }
      format.xml  { render :json => @workouts.to_xml }
    end
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      render json: {message: 'workout created'}

      # render 'show', formats: [:json], status: 201
    else
      render json: {error: "workout could not be created"}, status: 422
    end
  end

  def workout_params
    params.require(:workout).permit(:title, :duration, :intensity, :description)
  end

end
end
end