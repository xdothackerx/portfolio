json.array!(@comments) do |comment|
  json.extract! comment, :id, :author, :authro_url, :author_email, :user_ip, :user_agent, :referrer, :content, :approved, :post_id
  json.url comment_url(comment, format: :json)
end
