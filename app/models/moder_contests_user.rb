class ModerContestsUser < ApplicationRecord
   belongs_to :user
   belongs_to :moder_contest
   has_one :winner, class_name: 'User', foreign_key: :winner_id

end
