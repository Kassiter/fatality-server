class PriviliegesFeature < ApplicationRecord
   has_and_belongs_to_many :privilieges, join_table: :privilieges_privilieges_features
   
   validates :icon, presence: true
   validates :description, presence: true

   def title
      vt = vip_type.present? ? "(#{vip_type})" : ""

      "#{description} #{vt}"
   end
end
