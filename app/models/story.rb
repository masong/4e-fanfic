class Story < ActiveRecord::Base
  def set_control(username)
    self.current_editor = username
    self.last_editor = username
    save
  end
end
