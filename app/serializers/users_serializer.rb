class UserSerializer < ActiveModel::Serializer
  attributes :uid, :name, :nickname, :github_username, :email, :karma, :image

end