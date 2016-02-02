module Api
  module V1
    class RolesController < ApplicationController

    # GET | List all roles
    # base_url/roles

      def index
        @roles = Role.all

        respond_to do |format|
          format.json  { render :json => @roles.to_json } 
          format.xml  { render :json => @roles.to_xml }
        end
      end

      def role_params
        params.require(:role).permit(:name, :description)
      end
    end
  end
end