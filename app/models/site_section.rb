class SiteSection < ActiveRecord::Base
  belongs_to :site
  belongs_to :section
end
