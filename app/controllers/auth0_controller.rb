class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    session[:auth_code] = params[:code]
    session[:state] = params[:state]

    if !user_exists?(session[:userinfo])
      User.create(email:session[:userinfo].info.email,name:session[:userinfo][:name])
    end

    # Redirect to the URL you want after successfull auth0
    redirect_to '/login'

  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
