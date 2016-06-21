class UserSerializer < ActiveModel::Serializer
  attributes :id, :zip_code, :phone_number, :authentication_token
end
