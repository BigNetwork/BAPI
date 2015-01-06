class User < ActiveRecord::Base

  self.table_name = "bigUser"
  self.primary_key = "userID"

end
