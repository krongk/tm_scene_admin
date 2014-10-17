class AdminResource < ActiveRecord::Base
  has_attached_file :asset, :default_url => "/assets/:style/missing.png"
  #validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 50.megabytes
  #validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :asset
end
