class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_many :comments, as: :commentable

  validates :user, :campaign, presence: true

end
