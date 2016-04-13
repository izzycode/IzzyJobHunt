module ApplicationHelper
  def home_page
    if logged_in?
      current_user
    else
      root_path
    end
  end

end
