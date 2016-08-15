class PetsController < ApplicationController
  def index
    # if params[:user_id]
    #   @pets = User.find(params[:user_id]).pets
    # else
    #   @pets = Pet.all
    # end
    @pets = Pet.adoptable_list
  end

  def show
      @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new(user_id: params[:user_id])
  end

  def create
      pet = current_user.pets.build(pet_params)
      if pet.save
        redirect_to user_pet_path(current_user, pet)
      else
        flash[:alert] = "You must fill out all fields"
        redirect_to new_user_pet_path(current_user)
      end
  end

  private 

  def pet_params
    params.require(:pet).permit(:name, :bio, :adoptable, :price, breeds_attributes: [:name], breed_ids:[])
  end
end
