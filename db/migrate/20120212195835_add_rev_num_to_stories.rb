class AddRevNumToStories < ActiveRecord::Migration
  def change
    add_column :stories, :revnum, :int
  end
end
