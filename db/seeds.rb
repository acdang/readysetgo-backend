# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# detroy order MATTERS! (Exercise, Block, Workout => last)
WorkoutBlock.destroy_all
SetRepetition.destroy_all
ExerciseSet.destroy_all
Exercise.destroy_all
Block.destroy_all
Workout.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'exercises.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    e = Exercise.new

    e.name = row["name"]
    e.category = row["category"]
    e.target_muscle_group = row["target_muscle_group"]
    e.equipment = row["equipment"]
    e.equip_type = row["equip_type"]
    e.ref_link = row["ref_link"]

    e.save
end
