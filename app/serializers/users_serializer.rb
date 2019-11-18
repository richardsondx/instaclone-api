class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username
end
