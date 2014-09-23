class Section < ActiveRecord::Base
  belongs_to :template

  has_many :site_sections

end
