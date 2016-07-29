class PetsController < ApplicationController
  def index
  end

  def new
    pet = Pet.new
  end
end
