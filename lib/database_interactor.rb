require_relative 'mongo_database_wrapper'
require_relative 'data_record_formatter'

class DatabaseInteractor

  def initialize(collection_name)
    @db = MongoDatabaseWrapper.new(collection_name)
  end

  def get_all_db_records
    db_records = find_all_db_records
    reformat_db_records(db_records)
  end

  def find_all_db_records
    @db.find_all_records
  end

  def reformat_db_records(records)
    DataRecordFormatter.new.parse_db_records
  end

  def close
    @db.close
  end

end
