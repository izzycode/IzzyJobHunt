module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id

    quote = HTTParty.get "http://quotes.rest/qod.json?category=inspire"
    result = JSON.parse quote.body
    result = result["contents"]["quotes"][0]
    @quote = result["quote"]
    @quote_image = result["background"]
  end

  def current_user
    if (user_id = session[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

end
