module SessionsHelper

  def log_in(user)

  end

  def logged_in?
    false
  end

  def current_user

  end

  def current_user?(user)
    false
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
