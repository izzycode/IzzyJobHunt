class CreateHonchos < ActiveRecord::Migration
  def change
    create_table :honchos do |t|
      t.string :name
      t.string :position
      t.string :phone_number
      t.string :email
      t.text :notes
      t.text :links

      t.belongs_to :company, index: true

      t.timestamps null: false
    end
  end
end
