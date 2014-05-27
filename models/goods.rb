class Goods
  attr_reader :id, :price, :from, :to, :pick_up_time, :arrive_time, :weight, :volume

  def initialize(price, from_address, to_address, pick_up_time, arrive_time, weight, volume, bid_ending_time, car_requirement, seller)
    @price = price
    @from = from_address
    @to = to_address
    @pick_up_time = pick_up_time
    @arrive_time = arrive_time
    @weight = weight
    @bid_ending_time = bid_ending_time
    @volume = volume
    @car_requirement = car_requirement
    @seller = seller
    @bidding_activities = []
  end

  def to_json(*a)
    {name: @name,
     price: @price,
     fromSuburb: @from.suburb,
     toSuburb: @to.suburb,
     pickUpTime: @pick_up_time,
     arriveTime: @arrive_time,
     weight: @weight,
     volume: @volume,
     bidEndingTime: @bid_ending_time,
     carType: @car_requirement.type,
     specialCarryingPermitRequired: @car_requirement.special_carrying_permit,
     palletJackRequired: @car_requirement.pallet_jack,
     tailGate: @car_requirement.tail_gate,
     sellerName: @seller.name
    }.to_json(*a)
  end

  def self.all
    from_address = Address.new '6 Marama Street', 'Blackburn South', 'Melbourne', 'VIC', '3130'
    from_address2 = Address.new '235 SpringVale Road', 'Hawthorn', 'Melbourne', 'VIC', '3156'
    from_address3 = Address.new '235 SpringVale Road', 'Geelong', 'Melbourne', 'VIC', '3156'
    to_address = Address.new '235 SpringVale Road', 'Glen Waverley', 'Melbourne', 'VIC', '3156'
    to_address2 = Address.new '18 Hull Road', 'Frankston', 'Melbourne', 'VIC', '3156'
    to_address3 = Address.new '18 Hull Road', 'Ballarat', 'Melbourne', 'VIC', '3156'
    car_requirement1 = CarRequirement.new 'Var', 0, 0, 'Not Required'
    car_requirement2 = CarRequirement.new 'Tray', 1, 1, '2.5T'
    car_requirement3 = CarRequirement.new 'Tautiner', 1, 1, '2.0T'
    car_requirement4 = CarRequirement.new 'Semi Trailer', 0, 1, '1.0T'
    seller1 = Seller.new 'Jacky Li'
    seller2 = Seller.new 'Thomas Wu'
    good1 = Goods.new('75', from_address, to_address, '2014-03-12T14:00:00', '2014-03-12T18:00:00', '2', '1.2x2.4x3', '2014-03-12T18:00:00', car_requirement1, seller1)
    good2 = Goods.new('70', from_address2, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '1', '1.2x2.4x2', '2014-03-12T18:00:00', car_requirement2, seller2)
    good3 = Goods.new('72', from_address3, to_address2, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '1.5', '1.2x2.4x2.4', '2014-03-12T18:00:00', car_requirement3, seller2)
    good4 = Goods.new('60', from_address, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '4', '1.2x2.4x1.2', '2014-03-12T18:00:00', car_requirement4, seller2)
    [good1, good2, good3, good4]
  end
end