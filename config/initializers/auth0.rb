Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV['AUTH0_ID'],
    ENV['AUTH0_SECRET'],
    'izzy-code.auth0.com',
    callback_path: 'http://localhost:3000/auth/auth0/callback'
  )
end
