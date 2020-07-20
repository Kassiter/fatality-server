class PersonalItem < ApplicationRecord
   belongs_to :user, optional: true

   validates :key, presence: true
   validates_uniqueness_of :key

   enum lifetime: [:month, :forever]
end
