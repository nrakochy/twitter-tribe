require 'mongo'

class MongoDatabaseWrapper
  include Mongo

  def initialize(collection_name)
    mongo_uri = ENV['MONGOLAB_URI']
    db_name = mongo_uri[%r{/([^/\?]+)(\?|$)}, 1]
    @client = MongoClient.from_uri(mongo_uri)
    @db = client.db(db_name)
    @collection = @db.collection(collection_name)
  end

  def find_all_records
  end

  def close
    @client.close
  end

end
