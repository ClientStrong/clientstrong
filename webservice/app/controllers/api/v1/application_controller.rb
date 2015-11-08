module Api
  module V1

    class ApplicationController < ActionController::API
      include ActionController::HttpAuthentication::Basic::ControllerMethods

      

    end
  end
end