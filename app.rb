require 'json'
require 'sinatra/base'
require_relative 'lib/external_api_interactor'
require_relative 'lib/database_interactor'
require_relative 'lib/data_record_evaluator'


class TwitterTribe < Sinatra::Base
  attr_reader :external_twitter_ids, :db_twitter_ids

  get '/' do
    erb :index
  end

  get '/twitter_api_call' do
    username = "trunkclub"
    @external_twitter_ids = ExternalApiInteractor.new.get_all_twitter_followers(username)
  end

  get '/database_records' do
    username = "trunkclub"
    @db_twitter_ids = DatabaseInteractor.new(username).get_all_db_records
  end

  get '/compare_external_to_db' do
    DataRecordEvaluator.new(@external_twitter_ids, @db_twitter_ids).find_followers_who_unfollow
  end
end
