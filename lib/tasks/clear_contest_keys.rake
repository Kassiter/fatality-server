require 'digest/bubblebabble'

namespace :privilieges do
  desc "TODO"
  task clear_contest_keys: :environment do
    unused_keys = ContestKey.where(report: nil)
    unused_keys.each do |c_key|
      PrevilegiesKey.where(key_name: c_key.key).destroy_all
    end

    unused_keys.destroy_all
  end
end
