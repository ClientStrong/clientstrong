class ExerciseSerializer < ActiveModel::Serializer
  attributes :name, :description, :intensity, :author, :image_url, :video_url
end
