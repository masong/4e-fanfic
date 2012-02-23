include UserHelper 
include StoryHelper

class StoriesController < ApplicationController
  def create
    redirect_to :controller => :admin, :action => 'create_story', :story => params[:story]
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
    if @story.current_editor == nil and @story.last_editor != user.email
      @story.set_control(user.email)
      user.member = true
      user.save
      redirect_to :controller => :stories, :action => :current
    else
      render :inline => "can't forcibly take control from someone else"
    end
  end

  def save
    @story = Story.find(params[:id])
    if @story.current_editor == user.email
      @story.body += params[:story][:body]
      @story.release_control
      @story.revnum += 1
      @story.save
      redirect_to :controller => :stories, :action => :current
    else
      render :inline => "can't save if you aren't the current editor"
    end
  end
end
