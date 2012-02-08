class AddCurrentEditorToStory < ActiveRecord::Migration
  def change
    add_column :stories, :current_editor, :text
  end
end
