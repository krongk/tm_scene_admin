class Site < ActiveRecord::Base
  belongs_to :template
  belongs_to :user
  has_many :site_images, :dependent => :destroy
  has_many :site_comments, :dependent => :destroy
  has_many :site_pages, :dependent => :destroy
  has_many :site_sections, :dependent => :destroy

  before_create :create_unique_key
  private
    def create_unique_key
      begin
        self.key = SecureRandom.hex(2)
      end while self.class.exists?(:key => key)
    end
end
