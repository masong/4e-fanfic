class UserMailer < ActionMailer::Base
  default from: "slugfest.fanfic@gmail.com"

  def fanfic_open(story)
    @emails = User.all.find_all {|u| u.email_alerts}.collect {|u| u.email}
    @url = 'http://localhost/'
    mail(:to => @emails, :subject => 'Fanfic is now open again')
  end
end
