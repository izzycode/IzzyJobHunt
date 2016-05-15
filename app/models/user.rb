class User < ActiveRecord::Base
  has_many :jobs
  has_many :companies

  has_secure_password
  # validates_presence_of :name
  validates_uniqueness_of :email

  # def self.sign_in_from_omniauth(auth)
  #   find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  # end
  #
  # def self.create_user_from_omniauth(auth)
  #   create(
  #     provider: auth['provider'],
  #     uid: auth['uid'],
  #     name: auth['info']['name']
  #   )
  # end


end
