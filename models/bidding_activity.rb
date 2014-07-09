class BiddingActivity
  include Mongoid::Document

  field :bidding_time, type: DateTime
  field :bidding_value, type: Integer
  field :bidder_Id, type: String
  field :bidder_name, type: String
  field :is_winner, type: Boolean

  embedded_in :listing
end