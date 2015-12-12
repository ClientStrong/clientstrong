class ExerciseSerializer < ActiveModel::Serializer
  attributes :name, :description, :intensity, :author
end
