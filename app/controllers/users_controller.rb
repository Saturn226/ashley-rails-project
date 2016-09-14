class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @user }
    end
  end

  def update
  end

  def edit
    @user = current_user
  end

  def destroy
  end

  end