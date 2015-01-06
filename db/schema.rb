# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141108192716) do

  create_table "SeatTicketRelation", primary_key: "ID", force: :cascade do |t|
    t.integer "seatTypeID",   limit: 4, null: false
    t.integer "ticketTypeID", limit: 4, null: false
  end

  create_table "SeatType", primary_key: "ID", force: :cascade do |t|
    t.string "name", limit: 60, default: "", null: false
  end

  create_table "bigAchievement", primary_key: "ID", force: :cascade do |t|
    t.string  "name",              limit: 60
    t.text    "description",       limit: 65535
    t.integer "points",            limit: 4
    t.integer "createdAt",         limit: 4
    t.integer "createdBy",         limit: 4
    t.integer "categoryID",        limit: 4,     null: false
    t.string  "autoConfirmType",   limit: 100
    t.integer "autoConfirmAmount", limit: 4
  end

  create_table "bigAchievementCategory", primary_key: "ID", force: :cascade do |t|
    t.string "name", limit: 60, null: false
  end

  create_table "bigGroup", primary_key: "ID", force: :cascade do |t|
    t.string  "name",        limit: 60
    t.integer "createdAt",   limit: 4
    t.integer "createdBy",   limit: 4,                 null: false
    t.integer "groupTypeID", limit: 4,                 null: false
    t.boolean "active",      limit: 1,  default: true, null: false
    t.integer "event_id",    limit: 4
  end

  create_table "bigGroupMember", primary_key: "ID", force: :cascade do |t|
    t.integer "userID",    limit: 4
    t.integer "groupID",   limit: 4
    t.integer "createdAt", limit: 4
  end

  create_table "bigMemberConfirmation", force: :cascade do |t|
    t.integer "userID",   limit: 4
    t.integer "dateTime", limit: 4
  end

  create_table "bigUser", primary_key: "userID", force: :cascade do |t|
    t.string   "userName",               limit: 60,               null: false
    t.string   "userPasswordHash",       limit: 60,               null: false
    t.integer  "userBirthYear",          limit: 4,                null: false
    t.integer  "userBirthMonth",         limit: 4,                null: false
    t.integer  "userBirthDay",           limit: 4,                null: false
    t.string   "userLastFourDigits",     limit: 4,                null: false
    t.string   "userGender",             limit: 60,               null: false
    t.string   "userFirstName",          limit: 60,               null: false
    t.string   "userSurname",            limit: 60,               null: false
    t.string   "userCareOf",             limit: 255
    t.string   "userStreet",             limit: 256,              null: false
    t.string   "userPostalNumber",       limit: 60,               null: false
    t.string   "userCity",               limit: 60,               null: false
    t.string   "userCountry",            limit: 60,               null: false
    t.string   "userPhoneNumber",        limit: 60,               null: false
    t.string   "userEmail",              limit: 60,               null: false
    t.integer  "level",                  limit: 4,   default: 1,  null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "biguser", ["email"], name: "index_bigUser_on_email", unique: true, using: :btree
  add_index "biguser", ["reset_password_token"], name: "index_bigUser_on_reset_password_token", unique: true, using: :btree
  add_index "biguser", ["unlock_token"], name: "index_bigUser_on_unlock_token", unique: true, using: :btree

  create_table "bigUserAchieved", primary_key: "ID", force: :cascade do |t|
    t.integer "userID",        limit: 4
    t.integer "achievementID", limit: 4
    t.integer "createdAt",     limit: 4
    t.integer "createdBy",     limit: 4
    t.integer "status",        limit: 4, null: false
  end

  create_table "bigevent", primary_key: "ID", force: :cascade do |t|
    t.string  "abbr",        limit: 32, null: false
    t.string  "name",        limit: 64, null: false
    t.integer "createdAt",   limit: 4,  null: false
    t.integer "startsAt",    limit: 4
    t.integer "endsAt",      limit: 4
    t.string  "place",       limit: 64
    t.string  "street",      limit: 64
    t.integer "postalCode",  limit: 4
    t.string  "city",        limit: 64
    t.float   "latitude",    limit: 24
    t.float   "longitude",   limit: 24
    t.integer "releaseDate", limit: 4,  null: false
  end

  add_index "bigevent", ["ID"], name: "ID", unique: true, using: :btree
  add_index "bigevent", ["abbr"], name: "abbr", unique: true, using: :btree

  create_table "comment", primary_key: "ID", force: :cascade do |t|
    t.integer "userID",     limit: 4,     null: false
    t.integer "newsPostID", limit: 4,     null: false
    t.text    "text",       limit: 65535, null: false
    t.integer "createdAt",  limit: 4,     null: false
  end

  create_table "dbMigrations", force: :cascade do |t|
    t.string  "fileName", limit: 200, null: false
    t.integer "date",     limit: 4,   null: false
  end

  create_table "groupType", primary_key: "ID", force: :cascade do |t|
    t.string  "name",      limit: 120, null: false
    t.integer "createdAt", limit: 4,   null: false
    t.integer "createdBy", limit: 4,   null: false
  end

  create_table "grouprights", primary_key: "ID", force: :cascade do |t|
    t.integer "groupTypeID", limit: 4,   null: false
    t.string  "model",       limit: 120, null: false
    t.boolean "create",      limit: 1,   null: false
    t.boolean "read",        limit: 1,   null: false
    t.boolean "readAll",     limit: 1,   null: false
    t.boolean "update",      limit: 1,   null: false
    t.boolean "updateAll",   limit: 1,   null: false
    t.boolean "delete",      limit: 1,   null: false
    t.boolean "deleteAll",   limit: 1,   null: false
    t.integer "createdAt",   limit: 4,   null: false
    t.integer "createdBy",   limit: 4,   null: false
  end

  add_index "grouprights", ["groupTypeID", "model"], name: "groupTypeAndModel", unique: true, using: :btree

  create_table "level", primary_key: "ID", force: :cascade do |t|
    t.string  "name",           limit: 128, null: false
    t.integer "apForNextLevel", limit: 4,   null: false
    t.string  "image",          limit: 256, null: false
  end

  create_table "seatMap", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",      limit: 4
    t.string  "name",         limit: 255, default: "",  null: false
    t.float   "zoomScale",    limit: 24,  default: 1.0
    t.integer "seatHeight",   limit: 4,   default: 34,  null: false
    t.integer "seatWidth",    limit: 4,   default: 40,  null: false
    t.integer "seatXSpacing", limit: 4,   default: 1,   null: false
    t.integer "seatYSpacing", limit: 4,   default: 1,   null: false
  end

  create_table "seatMapArea", primary_key: "ID", force: :cascade do |t|
    t.integer "seatMapID",   limit: 4
    t.integer "width",       limit: 4
    t.integer "height",      limit: 4
    t.integer "x",           limit: 4
    t.integer "y",           limit: 4
    t.string  "name",        limit: 60
    t.text    "description", limit: 65535
  end

  create_table "ticketPeriod", primary_key: "ID", force: :cascade do |t|
    t.integer "startsAt", limit: 4, null: false
    t.integer "endsAt",   limit: 4, null: false
  end

  create_table "viewtorecache", primary_key: "ID", force: :cascade do |t|
    t.string  "url",      limit: 120, default: "",    null: false
    t.boolean "recached", limit: 1,   default: false, null: false
    t.integer "created",  limit: 4,                   null: false
  end

  add_index "viewtorecache", ["url", "recached"], name: "urlAndRecached", using: :btree

  create_table "wgXsFAQ", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",   limit: 4,     null: false
    t.text    "question",  limit: 65535
    t.text    "answer",    limit: 65535
    t.integer "createdAt", limit: 4
  end

  create_table "wgXsHappening", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",         limit: 4,     null: false
    t.string  "name",            limit: 255,   null: false
    t.integer "startsAt",        limit: 4,     null: false
    t.integer "endsAt",          limit: 4,     null: false
    t.text    "rules",           limit: 65535, null: false
    t.integer "createdAt",       limit: 4,     null: false
    t.string  "createdBy",       limit: 255,   null: false
    t.integer "happeningTypeID", limit: 4,     null: false
  end

  create_table "wgXsHappeningType", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",      limit: 4,     null: false
    t.string  "name",         limit: 255,   null: false
    t.text    "generalRules", limit: 65535, null: false
    t.integer "createdAt",    limit: 4,     null: false
    t.integer "createdBy",    limit: 4,     null: false
  end

  create_table "wgXsNewsPost", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",   limit: 4,     null: false
    t.integer "createdAt", limit: 4,     null: false
    t.integer "authorID",  limit: 4,     null: false
    t.string  "header",    limit: 255,   null: false
    t.text    "content",   limit: 65535, null: false
  end

  create_table "wgXsOrder", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",        limit: 4,  null: false
    t.integer "ownerUserID",    limit: 4,  null: false
    t.integer "createdAt",      limit: 4,  null: false
    t.float   "sumToBePaid",    limit: 24, null: false
    t.boolean "cancelled",      limit: 1,  null: false
    t.integer "referrerUserID", limit: 4
  end

  create_table "wgXsPayment", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",         limit: 4,   null: false
    t.integer "createdAt",       limit: 4,   null: false
    t.integer "createdByUserID", limit: 4,   null: false
    t.integer "orderID",         limit: 4,   null: false
    t.string  "paymentType",     limit: 128, null: false
    t.boolean "bookkept",        limit: 1,   null: false
  end

  create_table "wgXsReminder", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",      limit: 4, null: false
    t.integer "sentAt",       limit: 4, null: false
    t.integer "sentByUserID", limit: 4, null: false
    t.integer "orderID",      limit: 4, null: false
  end

  create_table "wgXsSeat", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",    limit: 4,                 null: false
    t.integer "tableRowID", limit: 4,                 null: false
    t.integer "number",     limit: 4,                 null: false
    t.integer "x",          limit: 4
    t.integer "y",          limit: 4
    t.boolean "locked",     limit: 1, default: false, null: false
    t.integer "seatTypeID", limit: 4,                 null: false
  end

  create_table "wgXsTableRow", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",     limit: 4,  null: false
    t.integer "seat_map_id", limit: 4,  null: false
    t.string  "name",        limit: 60, null: false
  end

  create_table "wgXsTicket", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",       limit: 4, null: false
    t.integer "ticketTypeID",  limit: 4, null: false
    t.integer "orderID",       limit: 4, null: false
    t.integer "createdAt",     limit: 4, null: false
    t.integer "ownedByUserID", limit: 4, null: false
    t.integer "ticketPriceID", limit: 4
    t.integer "seatID",        limit: 4
    t.integer "entryCode",     limit: 4
    t.integer "enteredLanAt",  limit: 4
  end

  create_table "wgXsTicketPrice", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",      limit: 4,  null: false
    t.integer "ticketTypeID", limit: 4,  null: false
    t.integer "createdAt",    limit: 4,  null: false
    t.float   "price",        limit: 24, null: false
    t.float   "discount",     limit: 24, null: false
  end

  create_table "wgXsTicketType", primary_key: "ID", force: :cascade do |t|
    t.integer "eventID",         limit: 4,                     null: false
    t.string  "name",            limit: 128,                   null: false
    t.text    "description",     limit: 65535,                 null: false
    t.integer "createdByUserID", limit: 4,                     null: false
    t.integer "createdAt",       limit: 4,                     null: false
    t.integer "maxTickets",      limit: 4,                     null: false
    t.boolean "haveSeat",        limit: 1,     default: false, null: false
    t.boolean "locked",          limit: 1,     default: false, null: false
    t.integer "ticketPeriodID",  limit: 4,                     null: false
  end

end
