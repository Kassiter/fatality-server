class ModerContest < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }

   has_many :moder_contests_users
   has_many :users, through: :moder_contests_users
end
