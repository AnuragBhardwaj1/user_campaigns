#attribute: :title, :tag, :duration
class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :todos, dependent: :destroy
  has_many :comments, as: :commentable

  validates :title, :duration, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 0, less_than: 100, allow_blank: true }
  validates :user, presence: true
  validate :owner_has_expert_role?, on: :create

  def owner?(possible_owner)
    user.eql? possible_owner
  end

  private
    def owner_has_expert_role?
      unless user && user.expert?
        errors.add(:user, 'Only experts can create campaigns')
      end
    end
end
