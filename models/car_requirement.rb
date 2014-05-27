class CarRequirement
  attr_reader :type, :special_carrying_permit, :pallet_jack, :tail_gate

  def initialize(type, special_carrying_permit, pallet_jack, tail_gate)
    @type = type
    @special_carrying_permit = special_carrying_permit
    @pallet_jack = pallet_jack
    @tail_gate = tail_gate
  end
end