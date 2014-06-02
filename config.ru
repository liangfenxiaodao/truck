require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

map('/listings') {run ListingController}