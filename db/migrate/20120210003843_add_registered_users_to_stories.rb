class AddRegisteredUsersToStories < ActiveRecord::Migration
  def change
    add_column :stories, :registered_users, :text
  end
end
