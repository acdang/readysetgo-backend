class CreateExerciseSets < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_sets do |t|
      t.string :name
      t.integer :rep_nums
      t.integer :rest_time
      t.integer :weight
      t.integer :active_time
      t.belongs_to :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
