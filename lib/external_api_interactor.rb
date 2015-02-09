require_relative 'twitter_rest_client'
require_relative 'data_record_formatter'

class ExternalApiInteractor
  
  def initialize
    @twitter = TwitterRestClient.new
    @formatter = DataRecordFormatter.new
  end

  def get_all_twitter_followers(username)
    twitter_ids = get_followers_from_twitter(username)
    find_twitter_ids_from_results(twitter_ids)
  end

  def get_followers_from_twitter(username)
    @twitter.get_all_twitter_followers(username)
  end

  def find_twitter_ids_from_results(twitter_ids)
    @formatter.extract_twitter_ids_from_external_results(twitter_ids)
  end

  def get_twitter_profiles_from_ids(user_ids)
    twitter_profiles = retrieve_user_information_from_twitter(user_ids)
    extract_twitter_profile_information(twitter_profiles)
  end

  def retrieve_user_information_from_twitter(user_ids)
    @twitter.get_twitter_user_profiles(user_ids)
  end

  def extract_twitter_profile_information(profiles)
    @formatter.extract_twitter_users_profiles_info(profiles)
  end

end
