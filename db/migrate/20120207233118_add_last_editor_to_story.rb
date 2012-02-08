class AddLastEditorToStory < ActiveRecord::Migration
  def change
    add_column :stories, :last_editor, :text
  end
end
