include UserHelper

class AdminController < ApplicationController
  def index
    @story = Story.new
  end
end
