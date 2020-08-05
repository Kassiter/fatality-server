class Contest < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }

   has_many :contests_users
   has_many :users, through: :contests_users

   validates :title, presence: true
   validates :description, presence: true
   validates :image, presence: true
end
