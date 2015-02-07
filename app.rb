require 'json'
require 'sinatra/base'
require_relative 'lib/external_api_interactor'
require_relative 'lib/database_interactor'


class TwitterTribe < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/twitter_api_call' do
    username = "trunkclub"
    ExternalApiInteractor.new.get_all_twitter_followers(username).to_json
  end

  get '/database_records' do
    username = "trunkclub"
    DatabaseInteractor.new(username).get_all_db_records
  end
end
