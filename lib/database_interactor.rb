require_relative 'mongo_database_wrapper'

class DatabaseInteractor

  def initialize(collection_name)
    @db = MongoDatabaseWrapper.new(collection_name)
  end

  def get_all_db_records
    @db.find_all_records
  end

  def close
    @db.close
  end

end
