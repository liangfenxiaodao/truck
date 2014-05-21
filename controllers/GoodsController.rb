class GoodsController < ApplicationController
  get '/' do
    content_type :json
    [{name: "jacky", price: 10 }].to_json
  end
end