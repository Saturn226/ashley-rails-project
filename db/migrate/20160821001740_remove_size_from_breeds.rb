class RemoveSizeFromBreeds < ActiveRecord::Migration
  def change
    remove_column :breeds, :size, :integer
  end
end
