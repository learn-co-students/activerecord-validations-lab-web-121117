class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :phone_number

      t.timestamps null: false
    end
  end
end
