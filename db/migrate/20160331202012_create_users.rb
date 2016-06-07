class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :uid, unique: true

      t.timestamps null: false
    end
  end
end
