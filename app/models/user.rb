class User < ActiveRecord::Base
  validates_presence_of :name

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :projects
  has_many :my_organizations, class_name: "Organization", foreign_key: :owner_id
  has_many :my_projects, class_name: "Project", foreign_key: :owner_id
  has_many :comments, foreign_key: :owner_id
  has_many :attachments

  enum role: [:admin, :employee]
  enum status: [:active, :blocked, :invited]

  scope :free_users, -> (project) { User.where.not(id: (project.user_ids + [project.owner.id])).collect {|p| [ p.name, p.id ]  } }

 end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
