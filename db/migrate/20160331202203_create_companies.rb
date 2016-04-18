class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :main_phone
      t.text :useful_links
      t.text :notes

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
