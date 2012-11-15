module Easy
  module ReferenceData
    def self.refresh(clazz, unique_attribute_symbol, unique_attribute_value, attributes)
      record = clazz.where(unique_attribute_symbol => unique_attribute_value).first

      if record.nil?
        record = clazz.new
        record.send "#{unique_attribute_symbol}=", unique_attribute_value
      end

      attributes.each_pair do |key, value|
        record.send "#{key}=", value
      end

      if record.new_record?
        puts "..creating #{clazz}(#{unique_attribute_value})"
      elsif record.changed?
        puts "..updating #{clazz}(#{unique_attribute_value})"
      end

      begin
        record.save!
      rescue
        puts "Save failed for #{record.class}[#{unique_attribute_symbol}: #{unique_attribute_value}] with attributes #{attributes.inspect}"
        raise
      end

      record
    end
  end
end
