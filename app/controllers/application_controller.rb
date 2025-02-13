class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :require_login
  before_action :detect_mobile_variant
  include SessionsHelper
  before_action :authenticate
  helper_method :logged_in?, :current_user

  def require_login
    # ログインを確認し、非ログイン時にリダイレクトする処理
  end

  # before_action do
  #   redirect_to access_denied_path if params[:token].blank?
  # end

  private

  # ログイン
  def logged_in?
    !!current_user
    !!session[:user_id]
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate
    return if logged_in?
    redirect_to_root_path, alert = "ログインしてください"
  end

  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end

end
