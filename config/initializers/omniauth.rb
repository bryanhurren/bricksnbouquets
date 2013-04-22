Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '505706086152635', '6d230c88b34a5076bcc60c8e83ac0614',
           :scope => 'email,publish_actions', :display => 'popup'
end