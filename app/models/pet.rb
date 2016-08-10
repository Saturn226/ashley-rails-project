class Pet < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed
  accepts_nested_attributes_for :breed

  def self.adoptable_list
    #self.all.select {|pet| pet.adoptable }
    where(adoptable: true)
  end

  def adopt
    # pet.user_id = user.id
    # pet.adoptable = false
    # pet.save
    update(user_id: current_user.id, adoptable: false)
  end

 def breed_names
    Breed.all.collect(&:name)
  end

  def breed_name=(name)
    #return if name == "" || name.nil?
    #self.breed = Breed.find_by(:name => name) || self.build_breed(:name => name)  
    !(self.breed = Breed.find_by(:name => name).nil?) || self.build_breed(:name => name) 
  end



end
