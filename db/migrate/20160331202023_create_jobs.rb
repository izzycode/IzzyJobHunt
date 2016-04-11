class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :web_address

      t.belongs_to :user, index: true
      t.boolean :archived, default: false
      t.belongs_to :company, index: true

      t.timestamps null: false
    end


  end
end
