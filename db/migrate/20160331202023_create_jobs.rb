class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :web_address

      t.belongs_to :user, index: true
      t.belongs_to :company, index: true

      t.timestamps null: false
    end


  end
end
