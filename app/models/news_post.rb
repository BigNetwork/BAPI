class NewsPost < ActiveRecord::Base

  self.table_name = "wgXsNewsPost"
  self.primary_key = "ID"

  has_many :comments, foreign_key: "newsPostID"
  has_one :author, foreign_key: "userID", class_name: "User"

end
