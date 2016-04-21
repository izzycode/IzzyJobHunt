class WelcomeController < ApplicationController
  before_action :set_auth
  
  def izzybam
    @user = User.new
  end

  private
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end


end
