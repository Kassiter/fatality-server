class ContestKey < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }
   after_commit :add_m_points, if: proc { |object| object.previous_changes.include?('approved') }

   def add_m_points
      Moder.contest.update(m_points: Moder.contest.m_points + 0.5)
   end
end
