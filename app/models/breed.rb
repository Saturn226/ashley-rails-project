class Breed < ActiveRecord::Base
  has_many :pets
  accepts_nested_attributes_for :pets
  #has_many :users, through: :pets





    def breed_name
    self.name
    end
end