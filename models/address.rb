class Address
  attr_reader :street, :suburb, :city, :state, :postcode

  def initialize(street, suburb, city, state, postcode)
    @street = street
    @suburb = suburb
    @city = city
    @state = state
    @postcode = postcode
  end
end