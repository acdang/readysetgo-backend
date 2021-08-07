class SetRepetition < ApplicationRecord
  belongs_to :block
  belongs_to :exercise_set

  def self.order_by_exercise_set_id
    self.all.order('exercise_set_id')
  end
end
