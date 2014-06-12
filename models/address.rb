class Address
  include Mongoid::Document

  field :street, type: String
  field :suburb, type: String
  field :city, type: String
  field :state, type: String
  field :postcode, type: String
  field :country, type: String
  field :latitude, type: BigDecimal
  field :longitude, type: BigDecimal
  embedded_in :user
end