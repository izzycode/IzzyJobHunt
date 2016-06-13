module UsersHelper

  def check_to_mail?
    if user_current_jobs.count >= 10 && user_current_kahunas.count >= 30
      true
    else
      false
    end
  end

  def admin
    if User.find_by(email: ENV['ADMIN_EMAIL']).nil?
      redirect_to root_path, error:"Sorry you don't have access to this option"
    end
    true
  end

  def user_exists?(userinfo)
    userinfo.email.downcase.nil?
  end
end
