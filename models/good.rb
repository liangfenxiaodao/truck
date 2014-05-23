class Good
  attr_reader :name, :id, :price, :from, :to, :pick_up_time, :arrive_time

  def initialize(name, price, from_address, to_address, pick_up_time, arrive_time)
    @name = name
    @price = price
    @from = from_address
    @to = to_address
    @pick_up_time = pick_up_time
    @arrive_time = arrive_time
  end

  def to_json(*a)
    {name: @name,
     price: @price,
     fromSuburb: @from.suburb,
     toSuburb: @to.suburb,
     pickUpTime: @pick_up_time,
     arriveTime: @arrive_time
    }.to_json(*a)
  end

  def self.all
    from_address = Address.new '6 Marama Street', 'Blackburn South', 'Melbourne', 'VIC', '3130'
    to_address = Address.new '235 SpringVale Road', 'Glen Waverley', 'Melbourne', 'VIC', '3156'
    good1 = Good.new('Lanolin Oil', '$75', from_address, to_address, '2014-03-12T14:00:00', '2014-03-12T18:00:00')
    good2 = Good.new('Manuka Honey', '$70', from_address, to_address, '2014-03-11T14:00:00', '2014-03-11T18:00:00')
    [good1, good2]
  end
end