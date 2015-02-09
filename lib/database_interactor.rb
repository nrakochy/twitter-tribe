require_relative 'mongo_database_wrapper'
require_relative 'data_record_formatter'


class DatabaseInteractor

  def initialize(collection_name)
    @db = MongoDatabaseWrapper.new(collection_name)
    @formatter = DataRecordFormatter.new
  end

  def get_all_db_records
    db_records = find_all_db_records
    formatted_records = reformat_db_records(db_records)
    close_db
    formatted_records
  end

  def find_all_db_records
    @db.find_all_records
  end

  def reformat_db_records(records)
    @formatter.parse_db_records(records)
  end

  def close_db
    @db.close
  end

end
