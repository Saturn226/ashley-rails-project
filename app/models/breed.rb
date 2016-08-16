class Breed < ActiveRecord::Base
  has_many :pet_breeds
  has_many :pets, through: :pet_breeds, dependent: :destroy

end