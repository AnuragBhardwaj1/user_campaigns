class TodosController < ApplicationController
  before_action :authorize_user
  before_action :load_campaign, only: [:new, :create]
  before_action :build_todo, only: :create
  before_action :load_todo, only: :show

  def new
    @todo = Todo.new
  end

  def create
    if @todo.save
      redirect_to campaign_path(@campaign), notice: 'Todo successfully created'
    else
      flash.now[:error] = @todo.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @comments = @todo.comments.includes(:author)
  end


  private
    def create_todo_params
      params.require(:todo).permit!
    end

    def build_todo
      @todo = current_user.todos.build(create_todo_params)
      @todo.campaign = @campaign
    end

    def load_campaign
      @campaign = Campaign.find_by(id: params[:campaign_id])
      redirect_to root_path unless @campaign
    end

    def authorize_user
      redirect_to login_path, notice: "Unauthorized" unless current_user
    end

    def load_todo
      @todo = Todo.find_by(id: params[:id])
      redirect_to root_path, erorr: 'Unauthorized' unless @todo
    end

end
