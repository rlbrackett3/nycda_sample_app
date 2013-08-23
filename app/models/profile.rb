class Profile < ActiveRecord::Base
  attr_accessible :bio, :cv, :email, :statement, :tel

  belongs_to :user
end
