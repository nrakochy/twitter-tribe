require 'json'
require_relative '../lib/data_record_formatter'

describe DataRecordFormatter do
  let(:formatter){ DataRecordFormatter.new }
  let(:time_stamp){ "2015-02-06 13:58:13 -0600" }
  let(:twitter_id1){ 123455 }
  let(:twitter_id2){ 67890 }
  let(:formatted_result1){ {twitter_id: twitter_id1, created_date: time_stamp}}
  let(:formatted_result2){ {twitter_id: twitter_id2, created_date: time_stamp}}
  let(:db_record1){ {"_id":{"$oid": "54d57df85964c9829add73c6"},"twitter_id": twitter_id1, "created_date": time_stamp} }
  let(:db_record2){ {"_id":{"$oid": "54d57df95964c9829add73c7"},"twitter_id": twitter_id2, "created_date": time_stamp} }
  let(:db_records){ [db_record1, db_record2] }

  describe '#format_individual_id' do
    it 'converts id_number and time stamp to hash' do
      expect(formatter.format_individual_id(twitter_id1, time_stamp)).to eq(formatted_result1)
    end
  end

  describe '#format_individual_id' do
    it 'converts array of twitter_ids to record format' do
      expect(formatter.format_twitter_records([twitter_id1, twitter_id2], time_stamp)).to eq([formatted_result1, formatted_result2])
    end
  end

  describe '#extract_twitter_id_from_db_record' do
    it 'returns an integer from db record hash' do
      parsed_record1 = JSON.parse(db_record1.to_json)
      expect(formatter.extract_twitter_id_from_db_record(parsed_record1)).to eq(twitter_id1)
    end
  end

  describe '#parse_db_records' do
    it 'returns an array of twitter_id numbers from db records' do
      expect(formatter.parse_db_records(db_records)).to eq([twitter_id1, twitter_id2])
    end
  end


end
