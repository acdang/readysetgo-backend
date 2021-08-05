class SetRepetitionSerializer < ActiveModel::Serializer
  attributes :id #, :exercise_set
  has_one :block
  has_one :exercise_set
end
