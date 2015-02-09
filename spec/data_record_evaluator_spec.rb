require_relative '../lib/data_record_evaluator'


describe DataRecordEvaluator do
  let(:external_records){ [1,2,3,4,5] }
  let(:db_records){ [1,2,4,7,8] }
  let(:overlapping_records){ [1,2,4] }
  let(:unique_external_records){ [3,5] }
  let(:unique_db_records){ [7,8] }
  let(:evaluator){ DataRecordEvaluator.new(external_records, db_records) }

  describe "#find_overlapping_followers" do
    it 'returns an array of the intersection between external records and db records' do
      expect(evaluator.find_overlapping_followers).to eq(overlapping_records)
    end
  end

  describe "#find_new_followers" do
    it 'returns an array of the intersection between external records and db records' do
      expect(evaluator.find_new_followers).to eq(unique_external_records)
    end
  end

  describe "#find_followers_who_unfollow" do
    it 'returns an array of the intersection between external records and db records' do
      expect(evaluator.find_followers_who_unfollow).to eq(unique_db_records)
    end
  end

end
