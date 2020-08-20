namespace :personal_items do
  desc "TODO"
  task generate_keys: :environment do
    %w(SKIN TRAIL ADMIN).each do |item|
      file_name_month = "tmp/#{item}_month_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
      10.times do
        base = Faker::String.random(length: 4..6)
        postfix = Digest::SHA2.hexdigest base
        result = "#{item}-#{postfix}"
        File.write(file_name_month, "#{result}\n", mode: 'a')
        PersonalItem.create!(key: result, lifetime: 0)
      end

      file_name_lifetime = "tmp/#{item}_lifetime_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
      10.times do
        base = Faker::String.random(length: 4..6)
        postfix = Digest::SHA2.hexdigest base
        result = "#{item}-#{postfix}"
        File.write(file_name_lifetime, "#{result}\n", mode: 'a')
        PersonalItem.create!(key: result, lifetime: 1)
      end
    end

    file_name = "tmp/RANDOM_#{DateTime.now.strftime("%d_%m_%G-%s")}.txt"
    10.times do
      base = Faker::String.random(length: 4..6)
      postfix = (Digest::SHA2.hexdigest base)
      result = "RANDOM-#{postfix}".truncate(44).split('...').first
      File.write(file_name, "#{result}\n", mode: 'a')
      PersonalItem.create!(key: result, lifetime: 0)
    end
  end

end
