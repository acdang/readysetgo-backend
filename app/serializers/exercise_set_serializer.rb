class ExerciseSetSerializer < ActiveModel::Serializer
  attributes :id, :exercise_rep_num, :rest_time, :weight, :active_time
  has_one :exercise
end
