class Template < ActiveRecord::Base
  include FormBuilder
  
  belongs_to :cate
  has_many :sections, :dependent => :destroy
  before_save :generate_form

end
