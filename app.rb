require 'sinatra/base'
require_relative 'lib/external_api_interactor'


class TwitterTribe < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/twitter_api_call' do
    username = "sandimetz"
    ExternalApiInteractor.new.get_all_twitter_followers(username)
  end
end
