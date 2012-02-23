include UserHelper

class AdminController < ApplicationController
  def index
    @story = Story.new
  end

  def create_story
    @story = Story.new(params[:story])
    @story.body = ''
    @story.is_active = false
    @story.registered_users = ','
    @story.visible = true
    @story.revnum = 0
    @story.save

    redirect_to :controller => :admin, :action => 'index'
  end


  def activate_story
    @story = Story.find(params[:id])
    @story.setActive
    redirect_to :controller => :admin, :action => :index
  end

  def deactivate_story
    @story = Story.find(params[:id])
    @story.deactivate
    redirect_to :controller => :admin, :action => :index
  end

  def hide_story
    @story = Story.find(params[:id])
    @story.visible = false 
    @story.is_active = false
    @story.save
    redirect_to :controller => :admin, :aciton => :index
  end
end
