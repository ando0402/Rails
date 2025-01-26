class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :require_login
  before_action :detect_mobile_variant

  def require_login
    # ログインを確認し、非ログイン時にリダイレクトする処理
  end

  # before_action do
  #   redirect_to access_denied_path if params[:token].blank?
  # end

  private
  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end

end
