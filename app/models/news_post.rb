class NewsPost < ActiveRecord::Base

  self.table_name = "wgXsNewsPost"
  self.primary_key = "ID"

  has_many :comments, foreign_key: "newsPostID"
  belongs_to :author, foreign_key: "authorID", class_name: "User"

end
