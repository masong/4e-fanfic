module StoryHelper
  def current_story
    return Story.all.find_all {|s| s.is_active}[0]
  end
end
