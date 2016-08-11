module Overrides
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

    def auth_origin_url
      'https://squaredex.herokuapp.com/auth-return'
    end

  end
end