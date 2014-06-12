require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'mongoid'
require 'geocoder'

Mongoid.load!("mongoid.yml")

ActiveSupport::Inflector.inflections do |inflect|
  inflect.singular("address", "address")
end

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

map('/listings') {run ListingController}
map('/users') {run UserController}