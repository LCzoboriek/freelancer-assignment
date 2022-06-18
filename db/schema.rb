
ActiveRecord::Schema[7.0].define(version: 2022_06_18_175124) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "freelancers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "bio"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
