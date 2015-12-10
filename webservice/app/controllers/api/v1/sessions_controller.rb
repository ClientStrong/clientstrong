module Api
module V1

class SessionsController < ApplicationController

# Content-Type application/json 
#
#{
#   "email": "snow.white@clientstrong.com",
#   "password": "pass"
# }

  def create
    @user = User.find_by(email: params[:email])
    password = params[:password]

    if @user.password == password 
      respond_to do |format|
        format.json  { render :json => @user.to_json}
      end
    else
      render json: {message: 'Log in failed...Try again.'}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Adios!"
  end

end

end
end


  