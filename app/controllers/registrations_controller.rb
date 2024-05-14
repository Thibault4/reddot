class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:is_seller] == "on"
      @user.build_seller
    end

    if @user.save
      redirect_to root_path, notice: "Inscription réussie !"
      session[:user_id] = @user.id
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :is_seller)
  end
  
end
