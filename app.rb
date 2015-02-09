require 'json'
require 'sinatra/base'
require_relative 'lib/external_api_interactor'
require_relative 'lib/database_interactor'
require_relative 'lib/data_record_evaluator'


class TwitterTribe < Sinatra::Base
  attr_reader :external_api_interactor

  get '/' do
    erb :index
  end

  get '/compare_records' do
    external_api_interactor = ExternalApiInteractor.new
    username = "trunkclub"
    external_twitter_ids = external_api_interactor.get_all_twitter_followers(username)
    db_twitter_ids = DatabaseInteractor.new(username).get_all_db_records
    results = DataRecordEvaluator.new(external_twitter_ids, db_twitter_ids).find_followers_who_unfollow
    unfollowers = external_api_interactor.get_twitter_profiles_from_ids(results)
    erb :unfollowers, :locals => { :unfollowers => unfollowers }
  end

end
