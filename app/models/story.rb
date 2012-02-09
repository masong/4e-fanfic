class Story < ActiveRecord::Base
  def set_control(user)
    self.current_editor = user
    self.last_editor = user 
    self.save
  end

  def pretty_date
    return self.updated_at.month.to_s + '/' + self.updated_at.day.to_s + '/' + self.updated_at.year.to_s
  end

  def deactivate
    self.is_active = false;
    self.save
  end

  def setActive
    Story.all.each {|s| s.deactivate; s.save}
    self.is_active = true
    self.save
  end
end
