class Project < ActiveRecord::Base
#  validates_presence_of :title
#  validates_uniqueness_of :title
#  validates_presence_of :text

  has_many :comments, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_and_belongs_to_many :users#,
        #:conditions => "user_id = 'Seattle'"
 # scope :name , -> { where(id: ) }

#named_scope :without_user, lambda{|user| user ? {:conditions => ["id != ?", user.id]} : {} }


#class Shirt < ActiveRecord::Base
#  scope :red, -> { where(color: 'red') }
#  scope :dry_clean_only, -> { joins(:washing_instructions).where('washing_instructions.dry_clean_only = ?', true) }
#end

#scope(name, body, &block)
#posts = Post.all
#posts.size # Fires "select count(*) from  posts" and returns the count
#posts.each {|p| puts p.name } # Fires "select * from posts" and loads post objects

#fruits = Fruit.all
#fruits = fruits.where(color: 'red') if options[:red_only]
#fruits = fruits.limit(10) if limited?

end
