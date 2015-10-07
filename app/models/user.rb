class User < ActiveRecord::Base
  validates_presence_of :name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :my_projects, class_name: "Project", foreign_key: :owner_id
  has_many :comments, foreign_key: :owner_id
  has_many :attachments

  has_and_belongs_to_many :projects

  scope :free_users, -> (project) { User.where.not(id: (project.user_ids + [project.owner.id])) }
 end




   # def self.free_users(project)
   #    ids = project.user_ids << project.owner.id
   #    User.where.not(id: ids)
   # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
