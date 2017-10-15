class AddIndexAndColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_nickname, :string, null: false
    add_column :users, :user_description, :string

    add_index :users, :user_nickname, unique: true
    
  end
end
