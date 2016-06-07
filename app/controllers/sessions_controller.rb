class SessionsController < ApplicationController
  before_filter :authorize, only: [:destroy]

  def new
  end

  def create
    if !Rails.env.development?
      quote = HTTParty.get "//quotes.rest/qod.json?category=inspire"
      result = (JSON.parse quote.body)["contents"]["quotes"][0]
      session[:quote] = result["quote"]
      session[:image] = result["background"]
    end

    if !session[:userinfo].nil? && User.find_by(uid: session[:userinfo].uid).nil?
      @user ||= User.create(email:session[:userinfo].info.email,
                  name:session[:userinfo].info.name,
                  uid:session[:userinfo].uid)
      log_in(@user)
    else
      @user ||= User.find_by(uid: session[:userinfo].uid)
      log_in(@user)
    end

    redirect_to @user
  end

  def destroy
    log_out if logged_in?
    redirect_to "https://izzy-code.auth0.com/v2/logout?returnTo=#{ENV['URL']}"
  end


end
