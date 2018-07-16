class Admin::UsersController < Admin::BaseController
  before_action :authorize_admin
  before_action :load_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end
  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(update_user_params)
      redirect_to edit_admin_user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

    def load_user
      @user = User.find_by(id: params[:id])
      redirect_to login_path unless current_user
    end

    def update_user_params
      update_params = params.require(:user).permit(:name, :profession, :service, :role)
    end

end
