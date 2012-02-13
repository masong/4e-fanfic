class UserMailer < ActionMailer::Base
  default from: "slugfest.fanfic@gmail.com"

  def fanfic_open(email)
    @email = email
    @url = 'http://localhost/'
    mail(:to => @email, :subject => 'Fanfic is now open again')
  end
end
