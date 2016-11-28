namespace :db do

  task create_profile_configs: :environment do
    User.all.each do |user|
      user.create_profile_config unless user.profile_config.present?
    end
  end

end
