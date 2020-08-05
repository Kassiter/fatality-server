class Moder < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }

   self.table_name = 'users'
   default_scope { where(role: 2) }

   enum m_type: [:main, :contest, :ruler, :no]

   def contest?
      self.m_type == 'contest'
   end

   def ruler?
      self.m_type == 'ruler'
   end

   scope :contest, -> { where(m_type: :contest).last }

   def name
      self.nickname
   end
end
