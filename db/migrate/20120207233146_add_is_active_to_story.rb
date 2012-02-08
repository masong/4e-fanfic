class AddIsActiveToStory < ActiveRecord::Migration
  def change
    add_column :stories, :is_active, :boolean
  end
end
