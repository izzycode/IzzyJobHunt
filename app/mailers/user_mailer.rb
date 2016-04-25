class UserMailer < ApplicationMailer
  default from: 'marcemc@yahoo.com'

  def ten_thirty_full
    @hp_director = ENV['HIRING_PARTNERS_DIRECTOR_EMAIL']
    @url = 'https://izzy-job-hunt.herokuapp.com/'
    mail(to: @hp_director.email, subject: "#{current_user.name.capitalize} has completed a 10/30!")
  end
end
