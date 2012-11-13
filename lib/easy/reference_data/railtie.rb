require 'rails'

module Easy
  module ReferenceData
    class Railtie < Rails::Railtie
      rake_tasks do
        load "tasks/easy_reference_data.rake"
      end
    end
  end
end