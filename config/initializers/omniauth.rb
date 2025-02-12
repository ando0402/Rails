Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  if Rails.env.development? || Rails.env.test?
    # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    # provider :github, "YOUR_CLIENT_ID", "YOUR_CLIENT_SECRET"
    provider :github, "Ov23ct6XQbYfOknbTWc5", "d1856bb6256d2d332ca946af4ff9d247396bc9ec"
  else
    provider :github,
     Rails.application.credentials.github[:client_id],
     Rails.application.credentials.config[:client_secret]
  end
end
