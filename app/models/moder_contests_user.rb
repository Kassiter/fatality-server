class ModerContestsUser < ApplicationRecord
   belongs_to :user
   belongs_to :moder_contest
end
