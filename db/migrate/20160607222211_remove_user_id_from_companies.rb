class RemoveUserIdFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :user_id, :integer
  end
end
