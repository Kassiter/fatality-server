class Moder < ApplicationRecord
   self.table_name = 'users'
   default_scope { where(role: 2) }

   enum m_type: [:main, :contest, :ruler, :no]

   def contest?
      self.m_type == 'contest'
   end

   def contest?
      self.m_type == 'ruller'
   end
end
