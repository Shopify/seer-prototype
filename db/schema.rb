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

ActiveRecord::Schema[7.0].define(version: 2022_05_14_183142) do
  create_table "estimates", force: :cascade do |t|
    t.integer "expert_id", null: false
    t.integer "project_id", null: false
    t.integer "max_magnitude"
    t.integer "likely_magnitude"
    t.integer "min_magnitude"
    t.decimal "max_frequency"
    t.decimal "likely_frequency"
    t.decimal "min_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "familiarity_id", null: false
    t.index ["expert_id"], name: "index_estimates_on_expert_id"
    t.index ["familiarity_id"], name: "index_estimates_on_familiarity_id"
    t.index ["project_id"], name: "index_estimates_on_project_id"
  end

  create_table "experts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "familiarities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenario_bins", force: :cascade do |t|
    t.integer "estimate_id", null: false
    t.decimal "value"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_scenario_bins_on_estimate_id"
  end

  add_foreign_key "estimates", "experts"
  add_foreign_key "estimates", "familiarities"
  add_foreign_key "estimates", "projects"
  add_foreign_key "scenario_bins", "estimates"
end
