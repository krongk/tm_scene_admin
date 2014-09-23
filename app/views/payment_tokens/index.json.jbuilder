json.array!(@payment_tokens) do |payment_token|
  json.extract! payment_token, :id, :user_id, :code, :status, :note, :actived_by, :actived_site_id
  json.url payment_token_url(payment_token, format: :json)
end
