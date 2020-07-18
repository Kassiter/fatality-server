class Priviliege < ApplicationRecord
   has_and_belongs_to_many :privilieges_features, join_table: :privilieges_privilieges_features
   
   validates :name, presence: true
   validates :link_lifetime, presence: true
   validates :link_month, presence: true
   validates :cost_month, presence: true
   validates :cost_lifetime, presence: true
end
