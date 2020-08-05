class ManageCommand < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }

   belongs_to :manage_command_category, foreign_key: :manage_command_category_id
end
