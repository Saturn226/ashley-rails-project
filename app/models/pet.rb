class Pet < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed

  def self.adoptable_list
    self.all.select {|pet| pet.adoptable }
  end

  def self.adopt(pet,user)
    pet.user_id = user.id
    pet.adoptable = false
    pet.save
  end

  def breed_name
    self.breed.name.capitalize
  end

  def breed_name=(name)
    !(self.breed = Breed.find_by(:name => name)).nil? || self.build_breed(:name => name)   
  end

end
