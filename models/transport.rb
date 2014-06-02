class Transport
  attr_reader :from, :to, :pick_up_time, :arrive_time

  def initialize(from_address, to_address, pick_up_time, arrive_time)
    @from = from_address
    @to = to_address
    @pick_up_time = pick_up_time
    @arrive_time = arrive_time
  end
end