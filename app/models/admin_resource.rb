class AdminResource < ActiveRecord::Base
  has_attached_file :asset, :default_url => "/assets/:style/missing.png"
  #validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
end
