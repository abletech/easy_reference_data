namespace :easy do
  namespace :reference_data do
    desc "Refreshes reference data values for the current environment."
    task :refresh => :environment do
      files = Dir[File.join(Rails.root, 'db', 'reference', '*.rb')].sort
      files += Dir[File.join(Rails.root, 'db', 'reference', Rails.env, '*.rb')].sort

      files.each do |file|
        puts "Populating reference #{file}"
        load file
      end
    end
  end
end