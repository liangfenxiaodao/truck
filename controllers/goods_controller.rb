class GoodsController < ApplicationController
  get '/' do
    content_type :json
    Good.all.to_json
  end
end