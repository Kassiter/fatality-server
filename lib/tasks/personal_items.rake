namespace :personal_items do
  desc "TODO"
  task generate_keys: :environment do
    %w(SKIN TRAIL).each do |item|
      10.times do
        base = Faker::String.random(length: 4..6)
        postfix = Digest::SHA2.hexdigest base
        result = "#{item}-#{postfix}"
        PersonalItem.create!(key: result)
      end
    end
  end

end
