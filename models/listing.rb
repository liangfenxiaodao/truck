class Listing
  include Mongoid::Document

  field :referenceRate, type: Integer
  field :weight, type: String
  field :length, type: String
  field :width, type: String
  field :height, type: String
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
end