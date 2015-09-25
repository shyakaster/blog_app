class AddUserIdToArticles < ActiveRecord::Migration
  def up
    add_reference :articles, :user, index: true
    add_foreign_key :articles, :users
  end
  def down
    remove_index :articles, :user
    remove_reference :articles, :user
    remove_foreign_key :articles, :users

  end
end
