class ExerciseSetSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_rep_num, :rest_time, :weight, :active_time, :exercise_id
  has_one :exercise
end
