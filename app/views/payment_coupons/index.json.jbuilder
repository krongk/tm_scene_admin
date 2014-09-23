json.array!(@payment_coupons) do |payment_coupon|
  json.extract! payment_coupon, :id, :user_id, :code, :price, :message, :status, :actived_by, :actived_site_id, :note
  json.url payment_coupon_url(payment_coupon, format: :json)
end
