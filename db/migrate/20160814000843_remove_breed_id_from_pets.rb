class RemoveBreedIdFromPets < ActiveRecord::Migration
  def change
     remove_column :pets, :breed_id
  end
end
