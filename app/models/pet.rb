class Pet < ActiveRecord::Base
  belongs_to :user

  def self.adoptable_list
    self.all.select {|pet| pet.adoptable }
  end

  def self.adopt(pet,user)
    pet.user_id = user.id
    pet.adoptable = false
    pet.save
  end
end
