require 'curies'

module DataMapper
  module Types
    class Curie < DataMapper::Type
      primitive String
      size 65535
      lazy true
       
      def self.load(value, property)
        if value.nil?
          nil
        elsif value.is_a?(String) && value.blank?
          nil
        elsif value.is_a?(String) && value.could_be_a_safe_curie?
          p = value.curie_parts
          ::Curie.new(p[0], p[1])
        else
          raise ArgumentError.new("+value+ must be nil or a String representing a sane Curie")
        end
      end
      
      def self.dump(value, property)
        return nil if value.nil? or value.blank?
        return value.to_s
      end
    end # class Curie
  end # module Types
end # module DataMapper