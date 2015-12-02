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

# GET method - get all roles;
# base_url/roles

  def index
    @roles = Role.all

    respond_to do |format|
      format.json  { render :json => @roles.to_json(:include =>  {:permissions => {:only => :id}})}
      format.xml  { render :json => @roles.to_xml(:include =>  {:permissions => {:only => :id}})}
    end
  end

  def roles_permissions
    @permissions = Role.find(params[:id]).permissions
    respond_to do |format|
      format.json { render :json => @permissions.to_json }
    end

  end

  def role_params
    # params.require(:client).permit(:name, :age, :email, :start_date, :active)
    params.require(:role).permit(:name, :description)
  end

end
end
end