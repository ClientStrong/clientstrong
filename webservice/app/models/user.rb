class User < ActiveRecord::Base

  has_and_belongs_to_many :roles

  before_create do |doc|
    doc.api_key = User.generate_api_key
  end

  def self.generate_api_key
    loop do
      token = SecureRandom.base64.tr('0+/=', 'bRat')
      break token unless User.exists?(api_key: token)
    end
  end

end
