# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_04_181912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.integer "rep_nums"
    t.integer "rest_time"
    t.integer "weight"
    t.integer "active_time"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "target_muscle_group"
    t.boolean "equipment"
    t.string "equip_type"
    t.string "ref_link"
    t.string "image"
    t.string "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "set_repetitions", force: :cascade do |t|
    t.bigint "exercise_set_id"
    t.bigint "block_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_id"], name: "index_set_repetitions_on_block_id"
    t.index ["exercise_set_id"], name: "index_set_repetitions_on_exercise_set_id"
  end

  create_table "workout_blocks", force: :cascade do |t|
    t.bigint "block_id", null: false
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_id"], name: "index_workout_blocks_on_block_id"
    t.index ["workout_id"], name: "index_workout_blocks_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "set_repetitions", "blocks"
  add_foreign_key "workout_blocks", "blocks"
  add_foreign_key "workout_blocks", "workouts"
end
