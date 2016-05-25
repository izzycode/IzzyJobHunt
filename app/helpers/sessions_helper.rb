module SessionsHelper

  def log_in(user)
    
  end

  def logged_in?
    !session[:userinfo].nil?
  end

  def current_user
    session[:userinfo].info
  end

  def current_user?(user)
    user == current_user
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  def forget(user)
  end

  def log_out
    forget(current_user)
    session.delete(:userinfo)
    @current_user = nil
  end

end
