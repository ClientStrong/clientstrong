module Api
  module V1
    class ExercisesController < ApplicationController

=begin
          base_url/exercises
          GET | List of all exercises
          returns: Array of Exercise objects
=end

      def index
        @exercises = Exercise.all
        render json: @exercises
      end

=begin

        base_url/exercises
        POST | Creates new exercise
        (name checked for presence and uniqueness)

        { "exercise":
          {   
          "name": "July's Heat",
            "description": "Even in winter you will sweat like on the hottest day of July.",
            "author": 2,
            "intensity": 4
          }
    }
=end

      def create
        @exercise = Exercise.new(exercise_params)
        
        if !@exercise.valid?
          render json: {message: @exercise.errors.messages}
        else
          
          if @exercise.save
            render json: {message: 'Exercise created'}, status: 200
          else
            render json: {error: "exercise could not be created"}, status: 422
          end

        end
      end

=begin
          base_url/exericses/{id}
          GET | Exercise object by id
=end

      def show
        @exercise = Exercise.find(params[:id])
        respond_to do |format|
          format.json { render :json => @exercise.to_json }
        end
      end

=begin
        base_url/exercises/{id}
        DELETE | Delete exercise with id
        will be allowed only to admin
=end

      def destroy
        @exercise = Exercise.find(params[:id])
        @exercise.destroy
        render json: {message: 'Exercise deleted'}
      end

=begin
        base_url/exercises/{id}
        PUT | Update exercise with id details

         { "exercise":
           {   
             "description": "This was a very good fat blaster."
           }
         }
=end

      def update
        @exercise = Exercise.find(params[:id])
        @exercise.update!(exercise_params)
        render json: @exercise
      end

      def exercise_params
        # :author will be current user do we still need to whitelist that attribute?
        params.require(:exercise).permit(:name, :description, :author, :intensity)
      end
    end 
  end
end