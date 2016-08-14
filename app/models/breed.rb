class Breed < ActiveRecord::Base
  has_many :pet_breeds
  has_many :pets, through: :pet_breeds
  #accepts_nested_attributes_for :pets
  #has_many :users, through: :pets





    # def breed_name
    #   self.name
    # end
end