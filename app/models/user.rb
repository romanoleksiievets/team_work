class User < ActiveRecord::Base
  include UserRoles

  devise :invitable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable, :confirmable
         # ,:omniauthable, omniauth_providers: [:facebook]

  has_and_belongs_to_many :projects
  has_one :profile, class_name: UserProfile
  has_many :organizations_users
  has_many :organizations, through: :organizations_users
  has_many :my_organizations, class_name: "Organization", foreign_key: :owner_id
  has_many :my_projects, class_name: "Project", foreign_key: :owner_id
  has_many :comments, foreign_key: :owner_id
  has_many :attachments
  has_many :campaigns
  has_many :identities

  accepts_nested_attributes_for :profile

  # validates :mobile, presence: true, uniqueness: true


  enum language: I18n.available_locales
  enum role: [:admin, :employee]
  enum status: [:active, :blocked, :invited]

  delegate :first_name, :last_name, :org_role, :teaching_courses, :talents, to: :profile, allow_nil: true

  scope :free_users, -> (project) { User.where.not(id: (project.user_ids + [project.owner.id])).collect {|p| [ p.name, p.id ]  } }

  def name
    "#{first_name} #{last_name}"
  end

  def teacher?
    self.profile.try(:org_role) == :teacher
  end

  def volunteer?
    self.profile.try(:org_role) == :volunteer
  end

  #Need this to send devise mails with sidekiq
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.avatar = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
