class ModerContest < ApplicationRecord

   has_many :moder_contests_users
   has_many :users, through: :moder_contests_users

   validates :age, presence: true
   validates :reason, presence: true
   validates :experience, presence: true
end
