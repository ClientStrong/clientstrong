class Api::V1::ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Serialization

  private 

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @member = Member.where(api_key: token).first
    end
  end

  # NOTE: For reference
  # Manual way of authenticate request
  def authenticate_manual 
    api_key = request.headers['X-Api-Key']
    @member = Member.where(api_key: api_key).first if api_key

    unless @member
      head status: :unauthorized
      return false
    end
  end
end