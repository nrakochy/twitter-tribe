require_relative 'twitter_rest_client'
require_relative 'data_record_formatter'

class ExternalApiInteractor

  def get_all_twitter_followers(username)
    twitter_ids = execute_twitter_api_call(username)
    reformat_twitter_results(twitter_ids)
  end

  def execute_twitter_api_call(username)
    TwitterRestClient.new.get_all_twitter_followers(username)
  end

  def reformat_twitter_results(twitter_ids)
    DataRecordFormatter.new.extract_twitter_ids_from_external_results(twitter_ids)
  end
end
