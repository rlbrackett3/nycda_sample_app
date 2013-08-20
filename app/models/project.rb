class Project < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :images
  # accepts_nested_attributes_for :images
end
