class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :blocks
end
