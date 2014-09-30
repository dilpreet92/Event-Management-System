class User < ActiveRecord::Base
  has_many :events
  has_secure_password
  validates :name, :email, presence: true
  validates :name, uniqueness: true
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.id = auth['uid']
      user.password = 'abc'
      user.email = 'eeedddd'
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end
end
