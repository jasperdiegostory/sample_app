class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true #this forces uniqueness in the datebase by creating an index around emails
  end
end
