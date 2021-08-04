class SetRepetitionSerializer < ActiveModel::Serializer
  attributes :id, :exercise_set
  has_one :block
end
