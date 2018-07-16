class CampaignsController < ApplicationController
  before_action :authorize_user
  before_action :find_campaign, only: [:show, :edit, :update]
  before_action :build_campaign, only: :create

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    if @campaign.save
      flash[:notice] = "Capaign has been successfully created"
      redirect_to campaign_path(@campaign)
    else
      flash.now[:error]  = @campaign.errors.messages.to_sentence
      render :new
    end
  end

  def edit

  end

  def show
    @todos = @campaign.todos.includes(:user)
    @comments = @campaign.comments.includes(:author)
  end

  private
    def authorize_user
      redirect_to root_path, error: 'Please Login' unless current_user
    end

    def build_campaign
      @campaign = current_user.campaigns.build(create_campaign_params)
    end

    def create_campaign_params
      params.require(:campaign).permit!
    end

    def find_campaign
      @campaign = Campaign.find_by(id: params[:id])
      redirect_to root_path unless @campaign.present?
    end
end

