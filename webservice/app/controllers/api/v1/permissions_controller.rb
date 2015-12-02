module Api
module V1

  class PermissionsController < ApplicationController

    def create
      @permission = permission.new(permission_params)
      if @permission.save
        render json: {message: 'permission created'}

        # render 'show', formats: [:json], status: 201
      else
        render json: {error: "permission could not be created"}, status: 422
      end
    end

    def index
      @permissions = Permission.all
      respond_to do |format|
        format.json  { render :json => @permissions.to_json }
        format.xml  { render :json => @permissions.to_xml }
      end
    end

    def add_permission_to_role
      @role = Role.find(params[:id])
      @permission = Permission.find(params[:id])
      @role.permissions << @permission
      
      respond_to do |format|
        format.json  { render :json => @role.to_json }
        format.xml  { render :json => @role.to_xml }
      end
    end


  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render json: @user
  end


    
    def permission_params
      params.require(:permission).permit(:name, :description)
    end
  end

end
end