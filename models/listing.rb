class Listing
  include Mongoid::Document

  field :price, type: Integer
  field :weight, type: String
  field :volume, type: String
  field :pick_up_time, type: DateTime
  field :arrive_time, type: DateTime
  field :bid_ending_time, type: DateTime
  field :vehicle_type, type: String
  field :special_carrying_permit_required, type: Boolean
  field :pallet_jack_required, type: Boolean
  field :tail_gate, type: String
  field :from_address, type: String
  field :to_address, type: String
  field :job_number, type: String

  belongs_to :user

  embeds_many :bidding_activity

  #def to_json
  #  {price: @price,
  #   fromSuburb: @transport.from.suburb,
  #   toSuburb: @transport.to.suburb,
  #   pickUpTime: @transport.pick_up_time,
  #   arriveTime: @transport.arrive_time,
  #   weight: @goods.weight,
  #   volume: @goods.volume,
  #   bidEndingTime: @bid_ending_time,
  #   vehicleType: @vehicle_requirement.type,
  #   specialCarryingPermitRequired: @vehicle_requirement.special_carrying_permit,
  #   palletJackRequired: @vehicle_requirement.pallet_jack,
  #   tailGate: @vehicle_requirement.tail_gate,
  #  }.to_json
  #end


  #def self.get_all
  #  #Address.new(street: "6 Marama Street", suburb: "Blackburn South", )
  #  #from_address = Address.new '6 Marama Street', 'Blackburn South', 'Melbourne', 'VIC', '3130'
  #  #from_address2 = Address.new '235 SpringVale Road', 'Hawthorn', 'Melbourne', 'VIC', '3156'
  #  #from_address3 = Address.new '235 SpringVale Road', 'Geelong', 'Melbourne', 'VIC', '3156'
  #  #to_address = Address.new '235 SpringVale Road', 'Glen Waverley', 'Melbourne', 'VIC', '3156'
  #  #to_address2 = Address.new '18 Hull Road', 'Frankston', 'Melbourne', 'VIC', '3156'
  #  #to_address3 = Address.new '18 Hull Road', 'Ballarat', 'Melbourne', 'VIC', '3156'
  #  vehicle_requirement1 = VehicleRequirement.new 'Var', 0, 0, 'Not Required'
  #  vehicle_requirement2 = VehicleRequirement.new 'Tray', 1, 1, '2.5T'
  #  vehicle_requirement3 = VehicleRequirement.new 'Tautiner', 1, 1, '2.0T'
  #  vehicle_requirement4 = VehicleRequirement.new 'Semi Trailer', 0, 1, '1.0T'
  #  transport1 = Transport.new from_address, to_address, '2014-03-12T14:00:00', '2014-03-12T18:00:00'
  #  transport2 = Transport.new from_address2, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00'
  #  transport3 = Transport.new from_address3, to_address2, '2014-03-11T14:00:00', '2014-03-11T18:00:00'
  #  transport4 = Transport.new from_address, to_address3, '2014-03-11T14:00:00', '2014-03-11T18:00:00'
  #  goods1 = Goods.new '2', '1.2x2.4x3'
  #  goods2 = Goods.new '1', '1.2x2.4x2'
  #  goods3 = Goods.new '1.5', '1.2x2.4x4'
  #  goods4 = Goods.new '4', '1.2x2.4x1'
  #  listing1 = Listing.new('75', goods1, transport1, '2014-03-12T18:00:00', vehicle_requirement1, User.all[0])
  #  listing2 = Listing.new('70', goods2, transport2, '2014-03-12T18:00:00', vehicle_requirement2, User.all[0])
  #  listing3 = Listing.new('72', goods3, transport3, '2014-03-12T18:00:00', vehicle_requirement3, User.all[0])
  #  listing4 = Listing.new('60', goods4, transport4, '2014-03-12T18:00:00', vehicle_requirement4, User.all[0])
  #  [listing1, listing2, listing3, listing4]
  #end
end