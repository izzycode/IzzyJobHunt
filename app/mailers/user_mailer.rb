class UserMailer < ApplicationMailer
  default from: 'student10thirty@gmail.com'

  def ten_thirty_full(user)
    @user = user
    @hp_director = ENV['HIRING_PARTNERS_DIRECTOR_EMAIL']
    @url = 'https://ezzy-job-hunt.herokuapp.com/'
    mail to: "marcemc@yahoo.com", subject: "#{user.name.split(" ").map{|x| x.capitalize}.join(" ")} has completed a 10/30!"
  end

  def user_contact(user, email, body)
    @user = user
    @email = email
    @body = body`enter code here`

    mail(from: email, subject: 'Contacts')
end



end
