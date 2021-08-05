class BlockSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :exercise_sets
end
