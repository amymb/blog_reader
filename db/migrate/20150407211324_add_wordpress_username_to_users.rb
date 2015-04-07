class AddWordpressUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wordpress_username, :string
  end
end
