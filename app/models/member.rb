class Member < ActiveRecord::Base

  include ActiveModel::Serializers::JSON

  has_and_belongs_to_many :roles
  # has_and_belongs_to_many :exercises

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_create do |doc|
    doc.api_key = Member.generate_api_key
  end

  def self.generate_api_key
    loop do
      token = SecureRandom.base64.tr('0+/=', 'bRat')
      break token unless Member.exists?(api_key: token)
    end
  end

end
