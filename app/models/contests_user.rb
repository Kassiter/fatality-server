class ContestsUser < ApplicationRecord
   belongs_to :user
   belongs_to :contest
   has_one :winner, class_name: 'User', foreign_key: :winner_id
end
