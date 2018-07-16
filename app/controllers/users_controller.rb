class UsersController < ApplicationController
  before_action :load_user

  def show
  end

  def edit
  end

  def update
  end

  private

    def load_user
      redirect_to login_path unless current_user
      @user = current_user
    end

end
