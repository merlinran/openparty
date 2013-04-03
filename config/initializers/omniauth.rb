Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :identity, fields: [:name, :email], model: User,
    on_failed_registration: lambda { |env|
      UsersController.action(:new).call(env)
    }

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }

  provider :weibo, ENV['WEIBO_KEY'], ENV['WEIBO_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :qq_connect, ENV['QQ_KEY'], ENV['QQ_SECRET']

end
