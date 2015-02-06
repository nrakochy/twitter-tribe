require 'json'
require_relative 'twitter_rest_client'

class ExternalApiInteractor

  def get_all_twitter_followers(username)
    twitter_ids = execute_twitter_api_call(username)
    reformat_twitter_results(twitter_ids)
  end

  def execute_twitter_api_call
    TwitterRestClient.new.get_all_twitter_followers(username).to_json
  end

  def reformat_twitter_results(twitter_ids)
    DataRecordFormatter.new.convert_twitter_results_to_db_format(twitter_ids)
  end
end
