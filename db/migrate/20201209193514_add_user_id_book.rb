class AddUserIdBook < ActiveRecord::Migration
  def change
    add_foreign_key :users, :books
  end
end
