module Api
module V1

class RolesController < ApplicationController

  def create
    @role = Role.new(role_params)
    if @role.save
      render json: {message: 'role created'}

      # render 'show', formats: [:json], status: 201
    else
      render json: {error: "Role could not be created"}, status: 422
    end
  end

  def role_params
    # params.require(:client).permit(:name, :age, :email, :start_date, :active)
    params.require(:role).permit(:name, :description)
  end

end
end
end