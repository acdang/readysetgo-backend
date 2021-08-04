class ExerciseSetSerializer < ActiveModel::Serializer
  attributes :id, :name, :rep_nums, :rest_time, :weight, :active_time, :exercise_id
  has_one :exercise
end
