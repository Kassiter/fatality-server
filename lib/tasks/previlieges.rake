require 'digest/bubblebabble'

namespace :privilieges do
  desc "TODO"
  task generate_keys: :environment do
    File.write('tmp/keys_dump.txt', "\n======================KEYS DUMP #{DateTime.now.strftime("%d/%m/%G")} ====================\n", mode: 'a');
    one_day_in_seconds = 86400
    %w([VIP] [Supreme] [Owner]).each do |group|
      File.write('tmp/keys_dump.txt', "\n------------#{group} MONTH------------\n", mode: 'a')
      15.times do
        base = Faker::String.random(length: 4..6)
        key = Digest::SHA256.hexdigest(base).slice(0, 20)
        File.write('tmp/keys_dump.txt', "#{key}\n", mode: 'a')
        sql = "INSERT INTO `vip_keys` (`key`, `group`, `time`, `created`, `lifetime`) VALUES ('#{key}', '#{group}', #{30*one_day_in_seconds}, #{DateTime.now.to_i}, 0)"
        PrevilegiesKey.connection.execute(sql)
      end
      File.write('tmp/keys_dump.txt', "\n------------#{group} LIFETIME------------\n", mode: 'a')
      15.times do
        base = Faker::String.random(length: 4..6)
        key = Digest::SHA256.hexdigest(base).slice(0, 20)
        File.write('tmp/keys_dump.txt', "#{key}\n", mode: 'a')
        sql = "INSERT INTO `vip_keys` (`key`, `group`, `time`, `created`, `lifetime`) VALUES ('#{key}', '#{group}', #{0}, #{DateTime.now.to_i}, 0)"
        PrevilegiesKey.connection.execute(sql)
      end
    end
  end

end
