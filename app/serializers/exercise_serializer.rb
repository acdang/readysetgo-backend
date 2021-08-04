class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :target_muscle_group, :equipment, :equip_type, :ref_link
  # :image, :comments
end
