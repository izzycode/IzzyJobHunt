module SessionsHelper

  def log_in(user)
    session[:user] = current_user
  end

  def logged_in?
    !session[:userinfo].nil?
  end

  def current_user
    User.find_by(email:session[:userinfo].info.email)
  end

  def current_user?(user)
    user == User.find_by(email:session[:userinfo].info.email)
  end

  def authorize
    # if logged_in?
    #   if current_user.id == params[:id]
    #     return true
    #   else
    #     redirect_to current_user, error:"Sorry, you don't have access to this action."
    #   end
    # else
    #   redirect_to "/"
    # end
  end

  def forget(user)
    session.delete(:user)
  end

  def log_out
    forget(current_user)
    session.delete(:userinfo)
  end

end
