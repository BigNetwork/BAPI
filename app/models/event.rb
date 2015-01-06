class Event < ActiveRecord::Base

  self.table_name = "bigevent"
  self.primary_key = "ID"

  has_many :news_posts, foreign_key: "eventID"

end
