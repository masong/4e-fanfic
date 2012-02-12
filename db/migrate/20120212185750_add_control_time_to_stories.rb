class AddControlTimeToStories < ActiveRecord::Migration
  def change
    add_column :stories, :control_time, :text
  end
end
