class Exercise < ActiveRecord::Base
  include ActiveModel::Serializers::JSON
  
  validates :name, presence: true, uniqueness: true

  # has_and_belongs_to_many :members

end