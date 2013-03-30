Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :weibo, ENV['3743914187'], ENV['2b44bde71e83987bd0e94da0a0607ce2']
end
