require 'active_support'

module Easy
  module ReferenceData

    def self.refresh(clazz, unique_attribute_symbol, unique_attribute_value, attributes)
      self.update_or_create(clazz, attributes.merge(unique_attribute_symbol => unique_attribute_value), keys: [unique_attribute_symbol])
    end

    def self.update_or_create(clazz, attributes, options)
      unique_attribute_keys = options.fetch(:keys)

      record = clazz.where(attributes.slice(*unique_attribute_keys)).first_or_initialize

      if record.new_record?
        $stderr.puts "..creating #{clazz}(#{attributes.slice(*unique_attribute_keys)})"
      else
        $stderr.puts "..updating #{clazz}(#{attributes.slice(*unique_attribute_keys)})"
      end

      begin
        record.update_attributes!(attributes)
      rescue
        $stderr.puts "Save failed for #{record.class} with attributes #{attributes.inspect}"
        raise
      end

      record
    end

    def self.load_files(wrap_in_transaction: false)
      if wrap_in_transaction
        ActiveRecord::Base.transaction do
          load_the_files
        end
      else
        load_the_files
      end
    end

    private_class_method

    def self.files
      files = Dir[File.join(Rails.root, 'db', 'reference', '*.rb')].sort
      files += Dir[File.join(Rails.root, 'db', 'reference', Rails.env, '*.rb')].sort
      files
    end

    def self.load_the_files
      files.each do |file|
        puts "Populating reference #{file}"
        load file
      end
    end

  end
end
