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

  end
end
