class ContestsUser < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }

   belongs_to :user
   belongs_to :contest
end
