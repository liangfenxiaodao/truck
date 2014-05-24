class Goods
  attr_reader :name, :id, :price, :from, :to, :pick_up_time, :arrive_time, :weight

  def initialize(name, price, from_address, to_address, pick_up_time, arrive_time, weight, bid_ending_time)
    @name = name
    @price = price
    @from = from_address
    @to = to_address
    @pick_up_time = pick_up_time
    @arrive_time = arrive_time
    @weight = weight
    @bid_ending_time = bid_ending_time
  end

  def to_json(*a)
    {name: @name,
     price: @price,
     fromSuburb: @from.suburb,
     toSuburb: @to.suburb,
     pickUpTime: @pick_up_time,
     arriveTime: @arrive_time,
     weight: @weight,
     bidEndingTime: @bid_ending_time
    }.to_json(*a)
  end

  def self.all
    from_address = Address.new '6 Marama Street', 'Blackburn South', 'Melbourne', 'VIC', '3130'
    from_address2 = Address.new '235 SpringVale Road', 'Hawthorn', 'Melbourne', 'VIC', '3156'
    from_address3 = Address.new '235 SpringVale Road', 'Geelong', 'Melbourne', 'VIC', '3156'
    to_address = Address.new '235 SpringVale Road', 'Glen Waverley', 'Melbourne', 'VIC', '3156'
    to_address2 =  Address.new '18 Hull Road', 'Frankston', 'Melbourne', 'VIC', '3156'
    to_address3 =  Address.new '18 Hull Road', 'Ballarat', 'Melbourne', 'VIC', '3156'
    good1 = Goods.new('Lanolin Oil', '75', from_address, to_address, '2014-03-12T14:00:00', '2014-03-12T18:00:00', '2', '2014-03-12T18:00:00')
    good2 = Goods.new('Manuka Honey', '70', from_address2, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '1', '2014-03-12T18:00:00')
    good3 = Goods.new('Blackmore Fish Oil', '72', from_address3, to_address2, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '1.5', '2014-03-12T18:00:00')
    good4 = Goods.new('Manuka Honey', '60', from_address, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '4', '2014-03-12T18:00:00')
    [good1, good2, good3, good4]
  end
end