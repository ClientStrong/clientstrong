# // TODO: Show list: Remove apikey and password from the members list object
# // TODO: Delete member: Needs to delete association (but is this function needed?!)
# // TODO: Update member: Needs validations and error handling


module Api
  module V1
    class MembersController < ApplicationController

      include ActionController::MimeResponds
      include ActionController::HttpAuthentication::Token::ControllerMethods
          
      # Authorization >> Token token="fqJGrU1pNyMPchkfquPW5gtt"
      before_action :authenticate, :only => :show

=begin
      base_url/index
      GET | List of all members
      returns: Array of Member objects
=end
      def index
        @members = Member.all

        respond_to do |format|
          format.json  { render :json => @members.to_json(:include =>  {:roles => {:only => :id}})}
          format.xml  { render :json => @members.to_xml(:include =>  {:roles => {:only => :id}})}
        end
      end

=begin
      base_url/members/{id}
      GET | Member object by id
      Requires Header: # Authorization >> Token token="fqJGrU1pNyMPchkfquPW5gtt"
      returns: Member object
=end
      def show
        @member = Member.find(params[:id])
        respond_to do |format|
          format.json { render :json => @member.to_json(except: [:api_key, :password], :include =>  {:roles => {:only => :id}}) }
        end
      end

=begin

    base_url/members
    POST | Creates new member
    (email and password checked for presence; 
      email checked for uniqueness)

    { "member":
       {   
         "email": "snow.white@clientstrong.com", 
         "password": "password", 
         "first_name": "Snow", 
         "last_name": "White",
         "address": "7 Forest Street, Fairytale", 
         "mobile": "234-234-3456",
         "birthday": "1900-12-02"
       },
      "role_id": 1
     }
=end

      def create
        @member = Member.new(member_params)
        
        if !@member.valid?
          render json: {message: @member.errors.messages}
        else
          @role = Role.find(params[:role_id])
          @member.roles << @role
          
          if @member.save
            render json: {message: 'Member created'}
          else
            render json: {error: "Member could not be created"}, status: 422
          end

        end
      end

      
=begin
    base_url/members/{id}
    DELETE | Delete member with id
=end
      def destroy
        @member = Member.find(params[:id])
        @member.destroy
        render json: {message: 'Member deleted'}
      end

=begin
    base_url/members/{id}
    PUT | Update member with id details

     { "member":
       {   
         "first_name": Dwarf
       }
     }
=end

      def update
        @member = Member.find(params[:id])
        @member.update!(member_params)
        render json: @member
      end

      def member_params
        params.require(:member).permit(:email, :password, :first_name, :last_name, :address, :mobile, :birthday, :role_id)
      end
    end

  end
end

