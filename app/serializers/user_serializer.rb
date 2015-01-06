class UserSerializer < ActiveModel::Serializer
  attributes :id, :userName, :userFirstName, :userSurname
end
