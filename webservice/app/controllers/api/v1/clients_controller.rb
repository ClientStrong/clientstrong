module Api
  module V1
    class ClientsController < ApplicationController
        include ActionController::MimeResponds


    # GET method - get all clients;
    # base_url/index

      def index
        @clients = Client.all
        render json: @clients
      end

    # GET method - get particular client;
    # base_url/clients/{id}

      def show
        @client = Client.find(params[:id])
        render json: @client
      end

    # POST method - create new client
    # base_url/clients
    # { "client": { 
          # "name":"Vilius",
          # "age": "21", 
          # "email": "new@gmail.com",
          # "start_date": "1989-01-12",
          # "active": true
        # }
    # }

      def create
        @client = Client.new(client_params)
        if @client.save
          render json: {message: 'created'}
          # render 'show', formats: [:json], status: 201
        else
          render json: {error: "Client could not be created"}, status: 422
        end
      end

      #DELETE method - delete client
      # base_url/clients/{id}

      def destroy
        @client = Client.find(params[:id])
        @client.destroy
        render json: {message: 'deleted'}
      end

      #PUT method - update client details
      # base_url/clients/{id}

      # { "client":
      #   {   
      #     "active": false
      #   }
      # }

        def update
          @client = Client.find(params[:id])
          @client.update!(client_params)
          render json: @client
        end

      def client_params
        # params.require(:client).permit(:name, :age, :email, :start_date, :active)
        params.require(:client).permit(:first_name, :last_name, :email, :notes, :active)
      end
    end
  end
end
