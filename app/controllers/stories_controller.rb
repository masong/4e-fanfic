include UserHelper 

class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
    @story.is_active = false

    respond_to do |format|
      if @story.save
        format.html { render 'stories/show.html.erb' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def index
  end

  def current
    @story = Story.all.find_all {|s| s.is_active}[0]
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
end
