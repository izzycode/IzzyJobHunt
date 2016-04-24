module ApplicationHelper
  def home_page
    if logged_in?
      current_user
    else
      root_path
    end
  end

  def mail_ready? #checks if 10/30 is full

  end
end
