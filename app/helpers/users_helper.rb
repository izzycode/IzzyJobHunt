module UsersHelper
  def check_to_mail?
    if Company.where(user_id: current_user.id).count >= 10 && user_current_kahunas.count >= 30
      true
    else
      false
    end
  end

  def user_exists?(userinfo)
    User.find_by(email:session[:userinfo].info.email.downcase).nil?
  end
end
