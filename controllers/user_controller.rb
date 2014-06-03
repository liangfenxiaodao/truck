require_relative 'application_controller'

class UserController < ApplicationController
  post '/' do
    User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      middle_name: params[:middle_name],
      is_customer: params[:is_customer],
      username: params[:username],
      password: params[:password]
    )
  end

  get '/:id' do
    User.find(params[:id]).to_json
  end
end