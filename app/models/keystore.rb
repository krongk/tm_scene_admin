class Keystore < ActiveRecord::Base

  validates :obj_type, :obj_id, :value, presence: true

  def self.get(site_page_id, key_name)
    key = CommonKey.get(key_name)
    return nil if key.nil?
    self.find_by(site_page_id: site_page_id, common_key_id: key.id)
  end

  def self.put(site_page_id, key_name, value)
    key = CommonKey.get(key_name)
    return nil if key.nil?
    return drop(site_page_id, key_name) if value.blank?
    ks = self.find_or_create_by(site_page_id: site_page_id, common_key_id: key.id)
    ks.value = value
    ks.save!
    true
  end

  def self.drop(site_page_id, key_name)
    key = CommonKey.get(key_name)
    return nil if key.nil?
    ks = self.find_by(site_page_id: site_page_id, common_key_id: key.id)
    ks.destroy if ks
    true
  end

  #SitePageKeystore.value_for(@site_page, 'title', type: 'string', default: true, required: true) 
  #the [opt] is used for generate form
  def self.value_for(site_page_id, key_name, opt={})
    self.get(site_page_id, key_name).try(:value)
  end

end
