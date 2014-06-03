class Address
  include Mongoid::Document

  field :street, type: String
  field :suburb, type: String
  field :city, type: String
  field :state, type: String
  field :postcode, type: String

  embedded_in :user

  def initialize(street, suburb, city, state, postcode)
    @street = street
    @suburb = suburb
    @city = city
    @state = state
    @postcode = postcode
  end
end