# Preview all emails at https://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def ten_thirty_full
    UserMailer.ten_thirty_full User.find(2)
  end
end
