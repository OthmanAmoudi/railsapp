class AddUsernameAndNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :uniq, :string
    add_column :users, :name, :string
  end
end
