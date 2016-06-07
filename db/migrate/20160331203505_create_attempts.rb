class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.date :date
      t.string :medium
      t.text :summary

      t.belongs_to :job, index: true

      t.timestamps null: false
    end
  end
end
