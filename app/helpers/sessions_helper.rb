module SessionsHelper

  def log_in(user)
    session[:user] = current_user
  end

  def logged_in?
    !session[:userinfo].nil?
  end

  def current_user
    User.find_by(email:session[:userinfo].info.email.downcase)
  end

  def current_user?(user)
    user == User.find_by(email:session[:userinfo].info.email.downcase)
  end

  def authorize
    redirect_to "/" unless logged_in?
  end

  def forget(user)
    session.delete(:user)
  end

  def log_out
    forget(current_user)
    session.delete(:userinfo)
  end

end
