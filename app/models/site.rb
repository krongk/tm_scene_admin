class Site < ActiveRecord::Base
  belongs_to :template
  belongs_to :user
  has_many :site_images, :dependent => :destroy
  has_many :site_comments, :dependent => :destroy
  has_many :site_pages, :dependent => :destroy
  has_many :site_sections, :dependent => :destroy
  before_create :create_unique_key
  after_create :init_html

  #thief: bad user, bad site -> not allow showing in case and template
  #recommend: good site -> show in template 
  #vip: payed site -> not show in case (if user ask for)
  #vip-recommend -> vip and can show in template examples
  STATUS = %w(nopay thief vip vip-recommend)

  private
    def create_unique_key
      begin
        self.key = SecureRandom.hex(2)
      end while self.class.exists?(:key => key)
    end

    #only init html on first create
    def init_html
      self.html = self.template.html
      self.save!
    end
end
