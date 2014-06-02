class User
  attr_reader :id, :name, :is_customer

  def initialize(name, is_customer)
    @name = name
    @is_customer = is_customer
  end
end