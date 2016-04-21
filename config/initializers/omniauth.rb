Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_ID'], ENV['LINKEDIN_SECRET'], scope: 'r_basicprofile', fields: ['id', 'email-address', 'first-name']

end


OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:auth_failure).call(env)
end
