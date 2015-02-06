require 'time'

class DataRecordFormatter

  def format_individual_id(id_number, time_stamp)
    {:twitter_id => id_number, :created_date => time_stamp }
  end

end
