module UserHelper
  def user
    if @user != nil
      puts "a"
      return @user
    elsif request.env['HTTP_VERIFIED'] == 'SUCCESS'
      puts "b"
      @user = User.all.find_all {|u| u.email == cert_email}[0]
      if @user == nil
        @user = create_user
        @user.save
      end
      return @user
    else
      puts "c"
      return nil
    end
  end

  def cert_email
    return request.env['HTTP_DN'].split('/')[-1][13..-1]
  end

  def is_admin?
    return user.email == 'mglidden@MIT.EDU'
  end

  def is_auth?
    return true
  end

  def is_current_user?(check_user)
    return (check_user == user)
  end

  def create_user
    params = {:email => cert_email, :name => 'mason', :member => false,
      :email_alerts => false}
    return User.new(params)
  end
end
