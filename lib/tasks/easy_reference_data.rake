def load_files
  files = Dir[File.join(Rails.root, 'db', 'reference', '*.rb')].sort
  files += Dir[File.join(Rails.root, 'db', 'reference', Rails.env, '*.rb')].sort

  files.each do |file|
    puts "Populating reference #{file}"
    load file
  end
end

namespace :easy do
  namespace :reference_data do
    desc "Refreshes reference data values for the current environment."
    task :refresh => :environment do
      load_files
    end
  end
end

namespace :easy do
  namespace :reference_data do
    desc "Refreshes reference data values for the current environment in an ActiveRecord transaction. This is useful if you want an all or nothing data refresh."
    task :refresh_in_transaction => :environment do

      ActiveRecord::Base.transaction do
        load_files
      end
    end
  end
end
