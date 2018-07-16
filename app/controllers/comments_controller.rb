class CommentsController < ApplicationController
  before_action :authorize_user
  before_action :load_commentable, :build_comment, only: :create

  def create
    if @comment.save
      @campaign = campaign
      flash[:notice] = 'Comment Created'
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
    redirect_to campaign_path(@campaign)
  end

  private
    def create_comments_params
      params.require(:comment).permit!
    end

    def build_comment
      @comment = current_user.comments.build(create_comments_params)
      @comment.commentable = @commentable
    end

    def load_commentable
      if params[:todo_id].present?
        @commentable  = Todo.find_by(id: params[:todo_id])
      elsif params[:campaign_id].present?
        @commentable = Campaign.find_by(id: params[:campaign_id])
      end

      redirect_to root_path, error: 'Unauthorized' unless @commentable
    end

    def campaign
      unless @commentable.class.to_s.eql? 'Campaign'
        campaign = @commentable.campaign
      else
        campaign = @commentable
      end
    end

end
