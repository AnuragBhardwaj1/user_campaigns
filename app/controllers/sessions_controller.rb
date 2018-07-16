class SessionsController < ApplicationController

  before_action :authorize_user, only: :destroy
  before_action :check_user_eligibility, only: :create

  def new
  end

  def create
    if login
      redirect_to user_path(current_user), notice: "Logged in successfully"
    else
      flash.now[:error]  = "Invalid Credentials!"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to welcome_path, notice: "You have been successfully logged out"
  end

  private

    def login
    if @user.try :authenticate, params[:password]
        session[:user_id] = @user.id
      end
    end

    def authorize_user
      redirect_to login_path, notice: "you are already logged out" unless current_user
    end

    def check_user_eligibility
      redirect_to login_path, alert: 'Invalid Email Address' unless user_exists_with_email
    end

    def user_exists_with_email
      @user ||= User.find_by(email: params[:email])
    end

end
