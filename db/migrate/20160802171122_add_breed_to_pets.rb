class AddBreedToPets < ActiveRecord::Migration
  def change
    add_column :pets, :breed_id, :integer
  end
end
