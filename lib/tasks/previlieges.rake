require 'digest/bubblebabble'

namespace :privilieges do
  desc "TODO"
  task generate_keys: :environment do
    month = 2592000
    %w([VIP] [Supreme]).each do |group|
      file_name_month = "tmp/#{group}_month_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
      File.write(file_name_month, "", mode: 'a');
      15.times do
        base = Faker::String.random(length: 4..6)
        key = Digest::SHA256.bubblebabble(base).slice(0, 28)
        File.write(file_name_month, "#{key}\n", mode: 'a')
        PrevilegiesKey.create!(
          key_name: key, 
          type: "vip_add", 
          expires: 0, 
          uses: 1, 
          sid: 0, 
          param1: group, 
          param2: 2592000
        )
      end
      file_name_lifetime = "tmp/#{group}_lifetime_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
      File.write(file_name_lifetime, "", mode: 'a');
      15.times do
        base = Faker::String.random(length: 4..6)
        key = Digest::SHA256.bubblebabble(base).slice(0, 28)
        File.write(file_name_lifetime, "#{key}\n", mode: 'a')
        PrevilegiesKey.create!(
          key_name: key, 
          type: "vip_add", 
          expires: 0, 
          uses: 1, 
          sid: 0, 
          param1: group, 
          param2: 0
        )
      end
    end
  end

end
