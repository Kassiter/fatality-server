class PersonalItem < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }
   belongs_to :user, optional: true

   validates :key, presence: true
   validates_uniqueness_of :key

   enum lifetime: [:month, :forever]
end
