require 'json'
require 'time'

class DataRecordFormatter

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
    {:twitter_id => id_number, :created_date => time_stamp }
  end

  def parse_db_records(db_records)
    parsed_records = JSON.parse(db_records)
    parsed_records.map{|record| extract_twitter_id_from_db_record(record) }
  end

  def extract_twitter_id_from_db_record(record)
    record["twitter_id"]
  end

end
