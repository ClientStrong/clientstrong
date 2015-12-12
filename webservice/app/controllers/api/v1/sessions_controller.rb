module Api
  module V1
    class SessionsController < ApplicationController

      # prepend_before_filter :require_no_authentication, :only => [:create ]
      # before_filter :ensure_params_exist, only: :create

    # Content-Type application/json 
    #
    #{
    #   "email": "snow.white@clientstrong.com",
    #   "password": "pass"
    # }

      def create
        @member = Member.find_by(email: params[:email])
        unless @member.nil?
          
          password = params[:password]

          if @member.password == password 
            respond_to do |format|
              format.json  { render :json => @member.to_json}
            end
          else
            render json: {message: 'Log in failed...Try again.'}
          end
        end
      end

      def destroy
        session[:member_id] = nil
        render json: {message: 'Log out.'}
      end
    end
  end
end


  