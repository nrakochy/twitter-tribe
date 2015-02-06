require 'json'
require_relative 'twitter_rest_client'

class ExternalApiInteractor

  def get_all_twitter_followers(username)
    TwitterRestClient.new.get_all_twitter_followers(username).to_json
  end
end
