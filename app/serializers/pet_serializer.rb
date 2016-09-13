class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :adoptable, :price, :pet_image
  has_one :user
end
