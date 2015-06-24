Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cas, host: 'fed.princeton.edu', url: 'https://fed.princeton.edu/cas'
  # provider :github, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret
end
