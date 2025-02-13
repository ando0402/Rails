class SessionsController < ApplicationController

  # Login
  def create
    ActiveRecord::Base.connected_to(role: :writing) do
      user = User.find_or_create_from_auth_hash!(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインしました"
    end
  end

  # Logout
  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end

end
