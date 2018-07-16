class Admin::BaseController < ApplicationController
  layout "admin"

  private

    def admin_exists_with_email
      @admin ||= Admin.find_by(email: params[:email])
    end

    def redirect_to_root_page
      redirect_to root_path
    end

    def authorize_admin
      redirect_to login_path, notice: "Unauthorized" unless current_user
    end
end
