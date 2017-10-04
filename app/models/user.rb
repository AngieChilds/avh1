class User < ApplicationRecord
  
  # change b to novice
  enum status: {novice: 0,trusty: 1, moderator: 2, admin: 3}
  attr_accessor :remember_token
  before_save { self.email = email.downcase } #user object
  validates :player, presence: true, length: { maximum: 50 },
                     uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }, allow_nil: true
  
# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  
  end
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end  
  
   # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
   # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
    
  end
 def to_param
   "#{id}-#{player.parameterize}"
 end
  
  has_many :boards
  has_many :comments, through: :boards
  has_many :showblogs
  has_many :showruns, through: :showblogs
  has_many :comps
  has_many :stories,  through: :comps
  has_many :jobs,     through: :comps
  has_many :prizes,   through: :comps
  has_many :rules,    through: :comps
  
  validates :player, presence: true, uniqueness: true  
  has_many :comps, :through => :comps_users  
  has_many :comp_users, :dependent => :destroy
 
end
  
  
  
  
  
  
  
  
  
 
  

