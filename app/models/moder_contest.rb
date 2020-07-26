class ModerContest < ApplicationRecord

   has_many :moder_contests_users
   has_many :users, through: :moder_contests_users
end
