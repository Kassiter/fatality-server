class PrevilegiesKey < ApplicationRecord
   connects_to database: { writing: :server, reading: :server }
   establish_connection :server
   self.inheritance_column = "not_sti"
   self.table_name = 'table_keys'
end
