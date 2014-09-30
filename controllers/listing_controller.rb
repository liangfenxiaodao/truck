require_relative 'application_controller'

class ListingController < ApplicationController
  get '/' do
    content_type :json
    Listing.all.to_json
  end

  post '/' do
    user = User.find(params[:user_id])
    from = user.addresses.find(params[:from_address_id])
    to = user.addresses.find(params[:to_address_id])
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
        to_address: "#{to.street}, #{to.suburb}, #{to.city}, #{to.state}, #{to.postcode}, #{to.country}, #{to.latitude}, #{to.longitude}",
        is_closed: false
    )
    user.listings.push listing
    listing
  end

  get '/:id' do
    content_type :json
    Listing.find(params[:id]).to_json
  end

  post '/:id/bidding_activities' do
    content_type :json
    listing = Listing.find(params[:id])
    bidding_activity = BiddingActivity.new(
        bidding_time: params[:bidding_time],
        bidding_value: params[:bidding_value],
        bidder_id: request.env['HTTP_USER_ID'],
        bidder_name: request.env['HTTP_USER_NAME'],
        is_winner: false
    )
    listing.bidding_activities.push bidding_activity
    listing.to_json
  end

  get '/:id/bidding_activities' do
    content_type :json
    Listing.find(params[:id]).bidding_activities.to_json
  end
end