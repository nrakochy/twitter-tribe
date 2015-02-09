require 'mongo'
require 'json'

class MongoDatabaseWrapper
  include Mongo

  def initialize(collection_name)
    mongo_uri = ENV['MONGOLAB_URI']
    mongo_uri = "mongodb://trunkclub:trunkclub@ds041671.mongolab.com:41671/heroku_app33774995"
    db_name = mongo_uri[%r{/([^/\?]+)(\?|$)}, 1]
    @client = MongoClient.from_uri(mongo_uri)
    @db = @client.db(db_name)
    @collection = @db.collection(collection_name)
  end

  def find_all_records
    @collection.find().to_a
  end

  def close
    @client.close
  end

end
