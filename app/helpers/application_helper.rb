module ApplicationHelper
  def home_page
    if logged_in?
      current_user
    else
      root_path
    end
  end

  def mail_ready
    if condition
      #ask if you want to mail / personalize mail to hiring partner director
      ten_thirty_full #call UserMailer method
    end
  end
end
