class RemoveBreedFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :breed
  end
end
