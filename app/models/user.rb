class User < ActiveRecord::Base
  def setup(email)
    @email = email
    @name = "mason"
    @member = false
    @email_alerts = false
    save
  end
end
