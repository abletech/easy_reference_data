namespace :easy do
  namespace :reference_data do
    desc "Refreshes reference data values for the current environment. Pass the wrap_in_transaction flag to refresh in a transaction."
    task :refresh, [:wrap_in_transaction] => :environment do |_task, args|
      Easy::ReferenceData.load_files(wrap_in_transaction: args[:wrap_in_transaction] == "wrap_in_transaction")
    end
  end
end
