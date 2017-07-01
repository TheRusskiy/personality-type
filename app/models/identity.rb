class Identity < ApplicationRecord
  belongs_to :user
  
  def self.find_with_omniauth(auth, user)
    find_by(uid: auth['uid'], provider: auth['provider'], user_type: user.to_s)
  end

  def self.create_with_omniauth(auth, user)
    create(uid: auth['uid'], provider: auth['provider'], user_type: user.to_s)
  end
end
