require 'mongoid'
require 'json'
$:.unshift(File.dirname(__FILE__))

require 'models/address'
require 'models/user'
require 'models/listing'

namespace :mongo do
  desc "setup database"
  task :db do
    Mongoid.load!("mongoid.yml")
  end

  desc "lists collections"
  task :users => :db do
    User.all.each{ |user|
      puts user.to_json
    }
  end

  task :create_user => :db do
    open(File.join(Dir.pwd, File::Separator, "fixtures/users.json"), "r") do |file|
      file.each_line do |line|
        user = User.new.from_json line.strip
        user.save!
      end
    end
  end

  task :add_address => :create_user do
    user = User.find_by(username: "jacky.li")
    file = File.read(File.join(Dir.pwd, File::Separator, "fixtures/addresses.json"))
    addresses = JSON.parse(file)
    addresses.each{ |address|
      user.address.push (Address.new.from_json (JSON.generate address))
    }
  end

end