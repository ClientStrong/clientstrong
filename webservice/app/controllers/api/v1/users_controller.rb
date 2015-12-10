module Api
module V1

class UsersController < ApplicationController

  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Token::ControllerMethods
      
  # Authorization >> Token token="fqJGrU1pNyMPchkfquPW5gtt"
  before_action :authenticate, :only => :show

# GET method - get all users;
# base_url/index

  def index
    @users = User.all

    respond_to do |format|
      format.json  { render :json => @users.to_json(:include =>  {:roles => {:only => :id}})}
      format.xml  { render :json => @users.to_xml(:include =>  {:roles => {:only => :id}})}
    end
  end

# GET method - get particular user;
# base_url/users/{id}

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render :json => @user.to_json(except: [:api_key, :password], :include =>  {:roles => {:only => :id}}) }
    end
  end

# POST method - create new user
# base_url/users
# { "user": { 
    # "name":"Vilius",
    # "age": "21", 
    # "email": "new@gmail.com",
    # "start_date": "1989-01-12",
    # "active": true
  # },
  # "roled_id" 2
# }

  def create
    @user = User.new(user_params)
    @role = Role.find(params[:role_id])
    @user.roles << @role
    if @user.save
      render json: {message: 'user created'}
    else
      render json: {error: "user could not be created"}, status: 422
    end
  end

  

#DELETE method - delete user
# base_url/users/{id}

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: 'user deleted'}
  end

#PUT method - update user details
# base_url/users/{id}

# { "user":
#   {   
#     "active": false
#   }
# }

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render json: @user
  end

  def user_params
    params.require(:user).permit(:password, :first_name, :last_name, :email, :notes, :active, :role_id)
  end
end

end
end

