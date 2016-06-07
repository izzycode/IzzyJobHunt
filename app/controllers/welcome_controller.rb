class WelcomeController < ApplicationController

  def izzybam
    if logged_in?
      redirect_to current_user
    end
  end

end
