class AddAttachmentPetImageToPets < ActiveRecord::Migration
  def self.up
    change_table :pets do |t|
      t.attachment :pet_image
    end
  end

  def self.down
    remove_attachment :pets, :pet_image
  end
end
