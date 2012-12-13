class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true #this forces uniqueness in the datebase by creating an index around emails. unique:true forces the unique. Creating index also makes searching the db better
  end
end
