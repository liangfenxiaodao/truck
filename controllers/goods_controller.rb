require_relative 'application_controller'

class GoodsController < ApplicationController
  get '/' do
    content_type :json
    Goods.all.to_json
  end
end