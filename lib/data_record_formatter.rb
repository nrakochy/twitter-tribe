require 'json'
require 'time'

class DataRecordFormatter
  attr_reader :formatted_db_records

  def initialize
    @formatted_db_records = []
  end

  def convert_twitter_results_to_db_format(twitter_results)
    twitter_ids = extract_twitter_ids_from_external_results(twitter_results)
    time_stamp = Time.now
    format_twitter_records(twitter_ids, time_stamp)
  end

  def extract_twitter_ids_from_external_results(twitter_results)
    cursor_results_arr = twitter_results.map{|cursor_result| cursor_result[:ids] }
    cursor_results_arr.flatten
  end

  def format_twitter_records(twitter_ids, time_stamp)
    twitter_ids.map{ |id| format_individual_id(id, time_stamp) }
  end

  def format_individual_id(id_number, time_stamp)
    { twitter_id: id_number, created_date: time_stamp }
  end

  def parse_db_records(db_records)
    converted_records = db_records.to_json
    parsed_records = JSON.parse(converted_records)
    parsed_records.map{|record| @formatted_db_records << extract_twitter_id_from_db_record(record) }
    @formatted_db_records
  end

  def extract_twitter_id_from_db_record(record)
    record["twitter_id"]
  end

  def extract_twitter_users_profiles_info(profiles)
    twitter_profiles = JSON.parse(profiles)
    twitter_profiles.map{|profile| extract_individual_user_information(profile) }
  end

  def extract_individual_user_information(profile)
    screen_name = profile["screen_name"]
    followers_count = profile["followers_count"]
    description = profile["description"]
    { screen_name: screen_name, followers_count: followers_count, description: description }
  end
end
