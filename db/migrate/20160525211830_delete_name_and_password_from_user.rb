class DeleteNameAndPasswordFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :name, :string
  end
end
