class VipUser < ApplicationRecord
   connects_to database: { writing: :server, reading: :server }
   establish_connection :server
   self.table_name = 'vip_users'
end
