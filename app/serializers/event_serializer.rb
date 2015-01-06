class EventSerializer < ActiveModel::Serializer

  attributes :ID, :abbr, :name, :createdAt, :startsAt, :endsAt, :place, :street, :postalCode, :city, :latitude, :longitude, :releaseDate

  has_many :news_posts, embed: :ids

end
