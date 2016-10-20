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

  def after_sign_in_path_for(resource_or_scope)
    'https://squaredex.herokuapp.com/auth-return'
  end

  private
  def authenticate_admin!
    render json: 'Unauthorized', status: :unauthorized unless current_user.admin?
  end

end
