require_relative 'application_controller'

class ListingController < ApplicationController
  get '/' do
    content_type :json
    Listing.all.to_json
  end

  post '/' do
    user = User.find(params[:id])
    from = user.address.find(params[:from_address_id])
    to = user.address.find(params[:to_address_id])
    listing = Listing.create(
        price: params[:price],
        weight: params[:weight],
        volume: params[:volume],
        pick_up_time: params[:pick_up_time],
        arrive_time: params[:arrive_time],
        bid_ending_time: params[:bid_ending_time],
        vehicle_type: params[:vehicle_type],
        special_carrying_permit_required: params[:special_carrying_permit_required],
        pallet_jack_required: params[:pallet_jack_required],
        tail_gate: params[:tail_gate],
        from_address: "#{from.street}, #{from.suburb}, #{from.city}, #{from.state}, #{from.postcode}, #{from.country}",
        to_address: "#{to.street}, #{to.suburb}, #{to.city}, #{to.state}, #{to.postcode}, #{to.country}"
    )
    user.listing.push listing
    listing
  end
end