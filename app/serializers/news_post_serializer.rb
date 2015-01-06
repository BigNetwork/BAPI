class NewsPostSerializer < ActiveModel::Serializer
  attributes :id, :eventID, :createdAt, :authorID, :header, :content

  has_many :comments
  has_one :author

end
