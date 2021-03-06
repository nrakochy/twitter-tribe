require 'twitter'
require 'json'

class TwitterRestClient

  def initialize
    @consumer_key = ENV['TWITTER_CONSUMER_KEY']
    @consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
    @access_token = ENV['TWITTER_ACCESS_TOKEN']
    @access_secret_token = ENV['TWITTER_ACCESS_SECRET_TOKEN']
    @client = connect_to_twitter
  end

  def connect_to_twitter
    Twitter::REST::Client.new do |config|
      config.consumer_key = @consumer_key
      config.consumer_secret = @consumer_secret
      config.access_token = @access_token
      config.access_token_secret = @access_secret_token
    end
  end

  def get_all_twitter_followers(username)
    all_twitter_followers = []
    cursor_num = -1
    while cursor_num != 0
      single_set_of_followers = get_single_cursor_list_of_followers(username, cursor_num)
      all_twitter_followers << single_set_of_followers
      cursor_num = locate_cursor_num(single_set_of_followers)
    end
    all_twitter_followers
  end

  def get_single_cursor_list_of_followers(username, cursor_num)
    cursor_info = Hash[:cursor => cursor_num]
    @client.follower_ids(username, cursor_info).attrs
  end

  def locate_cursor_num(result)
    result[:next_cursor]
  end

  def get_twitter_user_profiles(twitter_ids)
    results = []
    rate_limit = 100
    collections = create_rate_limit_collection(twitter_ids, rate_limit)
    collections.map { |id_set| results << retrieve_set_of_user_info(id_set) }
    results.flatten.to_json
  end

  def retrieve_set_of_user_info(id_set)
    users = @client.users(id_set)
    users.map{ |record| record.attrs }
  end

  def create_rate_limit_collection(twitter_ids, rate_limit)
    collection = []
    while !twitter_ids.empty?
      id_set = twitter_ids.take(rate_limit)
      collection << id_set
      twitter_ids -= id_set
    end
    collection
  end
end
