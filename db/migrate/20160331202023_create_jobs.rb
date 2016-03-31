class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :web_address

      t.timestamps null: false
    end
  end
end
