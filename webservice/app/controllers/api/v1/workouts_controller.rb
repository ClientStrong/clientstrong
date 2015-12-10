module Api
module V1

class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all

    # respond_to do |format|
      # format.json  { render :json => @workouts.to_json }
    render json: @workouts
      # format.xml  { render :xml => @workouts.to_xml }
    # end
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

# GET method - get particular workout;
# base_url/workouts/{id}

  def show
    @workout = Workout.find(params[:id])
    respond_to do |format|
      format.json { render :json => @workout.to_json }
    end
  end

  

  #DELETE method - delete workout
# base_url/workout/{id}

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    render json: {message: 'workout deleted'}
  end

#PUT method - update user details
# base_url/workouts/{id}

# { "workout":
#   {   
#     "intensity": 1
#   }
# }

  def update
    @workout = Workout.find(params[:id])
    @workout.update!(workout_params)
    render json: @workout
  end

  def workout_params
    params.require(:workout).permit(:title, :duration, :intensity, :description)
  end

end
end
end