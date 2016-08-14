class PetBreed < ActiveRecord::Base
  belongs_to :pet
  belongs_to :breed
end