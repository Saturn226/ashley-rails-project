class PetsController < ApplicationController
  def index #adoptable pets
    @pets = Pet.adoptable_list.page(params[:page])
    respond_to do |format| 
      format.json { render json: @pets }
      format.html{render action: :index, layout: request.xhr? == nil}
    end
  end

  def show
      @pet = Pet.find(params[:id])
      respond_to do |format|
      format.html { render :show }
      format.json { render json: @pet}
    end
  end

  def new
    @pet = Pet.new(user_id: params[:user_id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to @pet
    else
      redirect_to edit_pet_path(@pet)
    end
  end

  def adopt
     pet = Pet.find(params[:id])
     pet.update(user: current_user, adoptable: false)
     redirect_to user_pet_path(current_user,pet)
  end

  def create
      @pet = current_user.pets.build(pet_params)
      if @pet.save
        #binding.pry
        redirect_to user_pet_path(current_user, @pet)
        #render json: @pet, status: 201
      else
        flash[:alert] = "You must fill out all fields"
        redirect_to new_user_pet_path(current_user)
      end
  end


  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to user_path(current_user)
  end

  private 

  def pet_params
    params.require(:pet).permit(:name, :bio, :adoptable, :price, :pet_image, breeds_attributes: [:name], breed_ids:[])
  end
end
