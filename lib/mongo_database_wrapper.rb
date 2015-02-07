require 'mongo'
require 'json'

class MongoDatabaseWrapper
  include Mongo

  def initialize(collection_name)
    mongo_uri = ENV['MONGOLAB_URI']
    db_name = mongo_uri[%r{/([^/\?]+)(\?|$)}, 1]
    @client = MongoClient.from_uri(mongo_uri)
    @db = @client.db(db_name)
    @collection = @db.collection(collection_name)
  end

  def find_all_records
    all_records = @collection.find().to_a
    all_records.to_json
  end

  def close
    @client.close
  end

end
