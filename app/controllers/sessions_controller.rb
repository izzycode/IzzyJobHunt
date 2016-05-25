class SessionsController < ApplicationController

  def new
  end

  def create
    if !Rails.env.development?
      quote = HTTParty.get "//quotes.rest/qod.json?category=inspire"
      result = (JSON.parse quote.body)["contents"]["quotes"][0]
      session[:quote] = result["quote"]
      session[:image] = result["background"]
    end

    redirect_to 'users#show'

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end


end
