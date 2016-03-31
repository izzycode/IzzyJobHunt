class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.datetime :date
      t.string :medium
      t.text :summary

      t.timestamps null: false
    end
  end
end
