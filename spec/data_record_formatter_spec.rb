require_relative '../lib/data_record_formatter'

describe DataRecordFormatter do
  let(:formatter){ DataRecordFormatter.new }
  let(:time_stamp){ "2015-02-06 13:58:13 -0600" }
  let(:twitter_id){ 123455 }
  let(:sample_individual_result){ {twitter_id: twitter_id, created_date: time_stamp}}

  describe '#format_individual_id' do
    it 'converts id_number and time stamp to hash' do
      expect(formatter.format_individual_id(twitter_id, time_stamp)).to eq(sample_individual_result)
    end
  end
end
