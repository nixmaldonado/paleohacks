
ActiveRecord::Schema.define(version: 20150507161437) do

  create_table "answer_votes", force: :cascade do |t|
    t.boolean  "vote"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answer_votes", ["answer_id"], name: "index_answer_votes_on_answer_id"
  add_index "answer_votes", ["user_id"], name: "index_answer_votes_on_user_id"

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.boolean  "correct",     default: false
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "question_topics", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "topic_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_topics", ["question_id"], name: "index_question_topics_on_question_id"
  add_index "question_topics", ["topic_id"], name: "index_question_topics_on_topic_id"

  create_table "question_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_votes", ["question_id"], name: "index_question_votes_on_question_id"
  add_index "question_votes", ["user_id"], name: "index_question_votes_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "topics", force: :cascade do |t|
    t.string   "topic" # cambiar name
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
