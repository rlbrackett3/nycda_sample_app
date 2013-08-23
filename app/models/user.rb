class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_one :profile

  validates :profile, presence: true, on: :update

  after_create :setup_profile

  private
    def setup_profile
      self.profile = Profile.new()
      self.profile.email = self.email
      self.save
    end
end
