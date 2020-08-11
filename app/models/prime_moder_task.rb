class PrimeModerTask < ApplicationRecord
   after_commit :add_m_points, if: proc { |object| object.previous_changes.include?('approved') }

   def add_m_points
      moder = Moder.where(m_type: 'main').last
      moder.update(m_points: moder.m_points + points_cost)
   end
end
