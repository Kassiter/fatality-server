class Log < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }

end
