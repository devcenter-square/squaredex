class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender, ActionController::HttpAuthentication::Token::ControllerMethods
  respond_to :json


  rescue_from RailsParam::Param::InvalidParameterError do |exception|
    render json: {errors: exception}, status: 422
  end

  def default_serializer_options
    {root: false}
  end

end
