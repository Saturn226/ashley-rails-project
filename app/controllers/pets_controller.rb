class PetsController < ApplicationController
  def index
    if params[:user_id]
      @pets = User.find(params[:user_id]).pets
    else
      @pets = Pet.all
    end
  end

  def show
    if params[:user_id]
      @pet = Pet.find(params[:id])
    else
      @pet = Pet.find(params[:id])
    end
  end

  def new
    @pet = Pet.new(user_id: params[:user_id])
  end

  def create
      pet = current_user.pets.build(pet_params)
      if pet.save
        redirect user_path
      else
        redirect new_user_pet_path
      end
  end

  def pet_params
    params.require(pet).permit(:name, :bio, :user_id)
  end
end
