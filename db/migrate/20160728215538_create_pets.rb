class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :bio
      t.boolean :adoptable
      t.decimal :price
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
