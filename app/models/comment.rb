class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :commentable, polymorphic: true

  validates :title, presence: true
  validates :commentable, presence: true

  validate :associated_todo_owned_by_novice, on: :create

  delegate :name, to: :author, prefix: true
  private
    def associated_todo_owned_by_novice
      if commentable.class.to_s.eql? 'Todo' && commentable.user.expert?
        errors.add(:base, 'Not Authorized to comment on expert todo')
      end
    end
end
