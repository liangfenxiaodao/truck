require_relative 'application_controller'

class ListingController < ApplicationController
  get '/' do
    content_type :json
    Listing.get_all.to_json
  end
end