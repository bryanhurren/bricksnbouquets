class User < ActiveRecord::Base
  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.save!
  	end
  end

  has_many :statuses

  def self.share_status(user_id, status_url)
    user = User.find(user_id)
    user.facebook.put_connections("me", "bricksnbouquets:brick", status: status_url)
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end
  
end
