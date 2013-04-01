Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :weibo, ENV['WEIBO_KEY'], ENV['WEIBO_SECRET']
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
