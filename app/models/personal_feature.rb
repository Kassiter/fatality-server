class PersonalFeature < ApplicationRecord
   connects_to database: { writing: :primary, reading: :primary }
   
   validates :name, presence: true
   validates :img_url, presence: true
   validates :option_name_basic, presence: true
   validates :option_name_advanced, presence: true
   validates :option_basic_link, presence: true
   validates :option_advanced_link, presence: true
   validates :option_basic_cost, presence: true
   validates :option_advanced_cost, presence: true
end
