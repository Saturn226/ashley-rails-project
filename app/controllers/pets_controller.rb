class PetsController < ApplicationController
  def index
    if params[:user_id]
      @pets = User.find(params[:user_id]).pets
    else
      @pets = Pet.all
    end
  end

  def show
      @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new(user_id: params[:user_id])
  end

  def create
      @pet = current_user.pets.build(pet_params)
      if @pet.save
        #redirect_to user_path(current_user)
        redirect_to user_pet_path(pet)
      else
        redirect_to new_user_pet_path
      end
  end


  def pet_params
    params.require(:pet).permit(:name, :bio, :breed_id, :adoptable, :price, :breed_name)
  end
end
