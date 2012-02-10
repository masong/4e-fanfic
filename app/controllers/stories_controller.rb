include UserHelper 
include StoryHelper

class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
    @story.is_active = false
    @story.registered_users = ','
    @story.visible = true
    @story.save

    redirect_to :controller => :admin, :action => 'index'
  end

  def show
    @story = Story.find(params[:id])
  end

  def index
  end

  def current
    @story = current_story
  end

  def take_control
    @story = Story.find(params[:id])
    if @story.current_editor == nil and @story.last_editor != username
      @story.set_control(username)
      redirect_to :controller => :stories, :action => :current
    else
      render :inline => "can't forcibly take control from someone else"
    end
  end

  def save
    @story = Story.find(params[:id])
    if @story.current_editor == username
      @story.body += '<br />'*2 + params[:story][:body]
      @story.current_editor = nil
      @story.save
      redirect_to :controller => :stories, :action => :current
    else
      render :inline => "can't save if you aren't the current editor"
    end
  end

  def activate
    @story = Story.find(params[:id])
    @story.setActive
    redirect_to :controller => :admin, :action => :index
  end

  def deactivate
    @story = Story.find(params[:id])
    @story.deactivate
    redirect_to :controller => :admin, :action => :index
  end

  def register
    current_story.add_registered(username)
    redirect_to :controller => :stories, :action => 'current'
  end

  def deregister
    current_story.deregister(username)
    redirect_to :controller => :stories, :action => 'current'
  end

  def hide
    @story = Story.find(params[:id])
    @story.visible = false 
    @story.is_active = false
    @story.save
    redirect_to :controller => :admin, :aciton => :index
  end
end
