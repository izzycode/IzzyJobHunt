class UserMailer < ApplicationMailer
  default from: 'marcemc@yahoo.com'

  def ten_thirty_full(user)
    @user = user
    @hp_director = ENV['HIRING_PARTNERS_DIRECTOR_EMAIL']
    @url = 'https://izzy-job-hunt.herokuapp.com/'
    mail to: "marcemc@yahoo.com", subject: "#{user.name.split(" ").map{|x| x.capitalize}.join(" ")} has completed a 10/30!"
  end
end
