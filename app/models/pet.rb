class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :pet_breeds
  has_many :breeds, through: :pet_breeds
  scope :adoptable_list, -> { where(adoptable: true) }

  validates :name, presence: true
 
  def breeds_attributes=(breeds_attributes)

    breeds_attributes.values.each do |attribute|
      if attribute[:name].present?  
        breed = Breed.find_or_create_by(attribute)
        if !self.breeds.include?(attribute[:name])
          self.pet_breeds.build(breed_id: breed.id)
        end
      end
    end
  end


  def adoptable?
    self.adoptable
  end

end
