
class DataRecordEvaluator
  attr_reader :overlapping_followers

  def initialize(external_records, db_records)
    @external_records = external_records
    @db_records = db_records
    @overlapping_followers = find_overlapping_followers
  end

  def find_overlapping_followers
    @external_records & @db_records
  end

  def find_new_followers
    @external_records - @overlapping_followers
  end

  def find_followers_who_unfollow
    @db_records - @overlapping_followers
  end
end
