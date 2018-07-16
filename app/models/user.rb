 # attributes => %w{ :name :email :password_digest :role :status :profession :service }
class User < ActiveRecord::Base
  STATUS = { qualified: 0, not_qualified: 1, banned: 2 }
  ROLE   = { novice: 0, expert: 1 }

  has_secure_password
  enum status: STATUS, role: ROLE

  has_many :campaigns, dependent: :restrict_with_error
  has_many :todos, dependent: :restrict_with_error
  has_many :comments, dependent: :destroy

  validates :name, :role, :status, presence: true, unless: :new_record?
  validates :name, uniqueness: { allow_blank: true }
  validates :email, presence: true, uniqueness: true, format: { with: REGEXP[:email], message: "Email is of invalid format" }
  validates :status, inclusion: { in: statuses.keys }
  validates :role, inclusion: { in: roles.keys }
  validates :profession, :service, presence: true, if: [:persisted?, :expert?]
  validates :profession, :service, absence: true, if: :novice?


end
