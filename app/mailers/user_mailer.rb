class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(user)
    @user = user
    @url = 'https://brandmeetsambassador.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome!')
  end

end
