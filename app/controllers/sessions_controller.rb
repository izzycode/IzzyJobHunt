class SessionsController < ApplicationController

  def new
  end

  def linkedin
    
  end

  def create
    # auth = request.env['omniauth.auth']
    # session[:omniauth] = auth.except('extra')
    # user = User.sign_in_from_omniauth(auth)
    # session[:user_id] = user.id
    # redirect_to root_url, notice: "Signed In"

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      @current_user ||= User.find_by(id: log_in(user))
      log_in user
      redirect_to user
    else
      flash.now[:danger]="Invalid email/password combination"
      render 'welcome/izzybam'
    end

    if !Rails.env.development?
      quote = HTTParty.get "//quotes.rest/qod.json?category=inspire"
      result = (JSON.parse quote.body)["contents"]["quotes"][0]
      session[:quote] = result["quote"]
      session[:image] = result["background"]
    end

  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: "Signed Out"
  end



  #
  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     @current_user ||= User.find_by(id: log_in(user))
  #     log_in user
  #     redirect_to user
  #   else
  #     flash.now[:danger]="Invalid email/password combination"
  #     render 'welcome/izzybam'
  #   end
  # end

end
