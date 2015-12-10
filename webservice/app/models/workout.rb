class Workout < ActiveRecord::Base
  include ActiveModel::Serializers::JSON

  has_and_belongs_to_many :users
  

end

# as a coach I can create workouts; client cannot create workouts;
# as a coach I can assign a workout to a client;