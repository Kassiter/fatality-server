class ManageCommandCategory < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }

   has_many :manage_commands
end
