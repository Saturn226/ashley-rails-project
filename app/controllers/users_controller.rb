class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def new
  end

  def create
  end
end