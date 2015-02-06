require_relative '../lib/data_record_formatter'

describe DataRecordFormatter do
  let(:formatter){ DataRecordFormatter.new }
  let(:time_stamp){ "2015-02-06 13:58:13 -0600" }
  let(:twitter_id1){ 123455 }
  let(:formatted_result1){ {twitter_id: twitter_id1, created_date: time_stamp}}
  let(:twitter_id2){ 67890 }
  let(:formatted_result2){ {twitter_id: twitter_id2, created_date: time_stamp}}

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

end
