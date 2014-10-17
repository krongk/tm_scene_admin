class Resource < ActiveRecord::Base

  has_attached_file :asset,
                    :path => ":class/:id/:style.:extension"

  validates_attachment_size :asset, :less_than => 50.megabytes
  #validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
end
