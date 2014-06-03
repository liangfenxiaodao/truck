class User
  include Mongoid::Document

  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :is_customer, type: Boolean
  field :username, type: String
  field :password, type: String

  embeds_many :address
end