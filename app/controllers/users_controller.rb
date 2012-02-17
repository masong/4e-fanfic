include UserHelper

class UsersController < ApplicationController
  def create
    @user = User.new()
  end

  def add_alerts
    user.email_alerts = true
    user.save
    redirect_to :controller => :stories, :action => :current
  end

  def remove_alerts
    user.email_alerts = false
    user.save
    redirect_to :controller => :stories, :action => :current
  end

  def register
    user.member = true
    user.save
    redirect_to :controller => :stories, :action => :current
  end

  def deregister
    user.member = false
    user.save
    redirect_to :controller => :stories, :action => :current
  end
end

