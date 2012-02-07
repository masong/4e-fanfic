include ApplicationHelper

class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])

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
    puts request
    for header in request.env
      puts "\n\n"
      puts header
    end
    render :inline => username
    #render :inline => request.env['HTTP_DN']
  end
end
