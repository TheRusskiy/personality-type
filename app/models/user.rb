class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
         
  has_many :restaurants, foreign_key: :submitter_id
  has_many :identities
  
  validates :email, uniqueness: { scope: :type }
  
  def self.create_with_omniauth(auth)
    case auth.provider
    when 'twitter'
      create(
        first_name: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0,20],
        twitter: auth.info.nickname
      )
    when 'facebook'
      create(
        first_name: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
  end
         
  def name
    [self.first_name, self.last_name].join(" ")
  end
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
