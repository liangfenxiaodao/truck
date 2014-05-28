class Goods
  attr_reader :id, :price, :from, :to, :pick_up_time, :arrive_time, :weight, :volume

  def initialize(price, from_address, to_address, pick_up_time, arrive_time, weight, volume, bid_ending_time, vehicle_requirement, customer)
    @price = price
    @from = from_address
    @to = to_address
    @pick_up_time = pick_up_time
    @arrive_time = arrive_time
    @weight = weight
    @bid_ending_time = bid_ending_time
    @volume = volume
    @vehicle_requirement = vehicle_requirement
    @customer = customer
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
     vehicleType: @vehicle_requirement.type,
     specialCarryingPermitRequired: @vehicle_requirement.special_carrying_permit,
     palletJackRequired: @vehicle_requirement.pallet_jack,
     tailGate: @vehicle_requirement.tail_gate,
     customerName: @customer.name
    }.to_json(*a)
  end

  def self.all
    from_address = Address.new '6 Marama Street', 'Blackburn South', 'Melbourne', 'VIC', '3130'
    from_address2 = Address.new '235 SpringVale Road', 'Hawthorn', 'Melbourne', 'VIC', '3156'
    from_address3 = Address.new '235 SpringVale Road', 'Geelong', 'Melbourne', 'VIC', '3156'
    to_address = Address.new '235 SpringVale Road', 'Glen Waverley', 'Melbourne', 'VIC', '3156'
    to_address2 = Address.new '18 Hull Road', 'Frankston', 'Melbourne', 'VIC', '3156'
    to_address3 = Address.new '18 Hull Road', 'Ballarat', 'Melbourne', 'VIC', '3156'
    vehicle_requirement1 = VehicleRequirement.new 'Var', 0, 0, 'Not Required'
    vehicle_requirement2 = VehicleRequirement.new 'Tray', 1, 1, '2.5T'
    vehicle_requirement3 = VehicleRequirement.new 'Tautiner', 1, 1, '2.0T'
    vehicle_requirement4 = VehicleRequirement.new 'Semi Trailer', 0, 1, '1.0T'
    customer1 = Customer.new 'Jacky Li'
    customer2 = Customer.new 'Thomas Wu'
    good1 = Goods.new('75', from_address, to_address, '2014-03-12T14:00:00', '2014-03-12T18:00:00', '2', '1.2x2.4x3', '2014-03-12T18:00:00', vehicle_requirement1, customer1)
    good2 = Goods.new('70', from_address2, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '1', '1.2x2.4x2', '2014-03-12T18:00:00', vehicle_requirement2, customer2)
    good3 = Goods.new('72', from_address3, to_address2, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '1.5', '1.2x2.4x2.4', '2014-03-12T18:00:00', vehicle_requirement3, customer2)
    good4 = Goods.new('60', from_address, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00', '4', '1.2x2.4x1.2', '2014-03-12T18:00:00', vehicle_requirement4, customer2)
    [good1, good2, good3, good4]
  end
end