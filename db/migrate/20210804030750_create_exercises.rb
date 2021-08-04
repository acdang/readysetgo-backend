class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :category
      t.string :target_muscle_group
      t.boolean :equipment
      t.string :equip_type
      t.string :ref_link
      t.string :image
      t.string :comments

      t.timestamps
    end
  end
end
