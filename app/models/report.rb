class Report < ApplicationRecord
   belongs_to :user, foreign_key: :user_id
   # after_commit :send_report_reward, if: proc { |object| object.previous_changes.include?('approved') }

   def send_report_reward
      return unless approved

      key = Devise.friendly_token.slice(0, 20).gsub(/[_&*]/, '-')
      key_ent = ContestKey.create!(key: key, on_date: Date.today)
      PrevilegiesKey.create!(
         key_name: key_ent.key,
         type: "shop_credits",
         expires: 0,
         uses: 1,
         sid: 0,
         param1: "6000"
      )

      UserMailer.with(user: user, key: key, report_id: id).report_reward_email.deliver_now
   end
end
