class Api::V1::ApplicationController < ActionController::API
  include ActionController::MimeResponds

  private 

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @client = Client.where(api_key: token).first
    end
  end

  # NOTE: For ref
  # Manual way of authenticate request
  def authenticate_manual 
    api_key = request.headers['X-Api-Key']
    @client = Client.where(api_key: api_key).first if api_key

    unless @client
      head status: :unauthorized
      return false
    end
  end
end