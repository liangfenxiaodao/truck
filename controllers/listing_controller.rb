require_relative 'application_controller'

class ListingController < ApplicationController
  get '/' do
    content_type :json
    Listing.all.to_json
  end

  post '/' do
    user = User.find(params[:user_id])
    from = user.address.find(params[:from_address_id])
    to = user.address.find(params[:to_address_id])
    listing = Listing.create(
        reference_rate: params[:reference_rate],
        weight: params[:weight],
        length: params[:length],
        width: params[:width],
        height: params[:height],
        pick_up_time: params[:pick_up_time],
        arrive_time: params[:arrive_time],
        bid_ending_time: params[:bid_ending_time],
        vehicle_type: params[:vehicle_type],
        special_carrying_permit_required: params[:special_carrying_permit_required],
        pallet_jack_required: params[:pallet_jack_required],
        tail_gate: params[:tail_gate],
        job_number: params[:job_number],
        from_address: "#{from.street}, #{from.suburb}, #{from.city}, #{from.state}, #{from.postcode}, #{from.country}, #{from.latitude}, #{from.longitude}",
        to_address: "#{to.street}, #{to.suburb}, #{to.city}, #{to.state}, #{to.postcode}, #{to.country}, #{to.latitude}, #{to.longitude}"
    )
    user.listing.push listing
    listing
  end

  post '/:id/bidding_activities' do
    content_type :json
    listing = Listing.find(params[:id])
    bidding_activity = BiddingActivity.new(
        bidding_time: params[:bidding_time],
        bidding_value: params[:bidding_value],
        bidder_id: params[:bidder_id],
        bidder_name: params[:bidder_name]
    )
    listing.bidding_activity.push bidding_activity
    listing.to_json
  end
end