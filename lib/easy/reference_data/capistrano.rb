# To load this capistrano configuration, require 'easy/deployment/dbreference' from deploy.rb
Capistrano::Configuration.instance(:must_exist).load do
  namespace :easy do
    namespace :reference_data do
      desc "Refresh reference data"
      task :refresh, :roles => :db, :only => { :primary => true } do
        migrate_target = fetch(:migrate_target, :latest)

        directory = case migrate_target.to_sym
                    when :current then current_path
                    when :latest  then latest_release
                    else raise ArgumentError, "unknown migration target #{migrate_target.inspect}"
                    end
        
        run "cd #{directory} && RAILS_ENV=#{rails_env} bundle exec rake easy:reference_data:refresh"
      end
    end
  end

  after 'deploy:migrate', 'easy:reference_data:refresh'
end
