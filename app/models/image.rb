class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :project_id, :title, :image, :image_cache

  belongs_to :project
end
