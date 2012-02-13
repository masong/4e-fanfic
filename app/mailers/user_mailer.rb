class UserMailer < ActionMailer::Base
  default from: "slugfest.fanfic@gmail.com"

  def fanfic_open(story)
    @emails = story.registered_users.split(',').find_all {|u| u != ''}.collect {|u| u+'@mit.edu'}
    @url = 'http://localhost/'
    mail(:to => @emails, :subject => 'Fanfic is now open again')
  end
end
