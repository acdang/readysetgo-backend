class CreateSetRepetitions < ActiveRecord::Migration[6.1]
  def change
    create_table :set_repetitions do |t|
      t.belongs_to :exercise_set
      t.belongs_to :block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
