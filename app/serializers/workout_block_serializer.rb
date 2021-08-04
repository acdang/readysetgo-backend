class WorkoutBlockSerializer < ActiveModel::Serializer
  attributes :id
  has_one :block
  has_one :workout
end
