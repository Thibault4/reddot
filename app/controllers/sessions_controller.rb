class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Connexion réussie !"
    else
      redirect_to new_session_path, alert: "Email ou mot de passe incorrect"
    end
  end

  def destroy
  end
end
