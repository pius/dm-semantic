require 'reddy'

module DataMapper
  module Types
    class RDFGraph < DataMapper::Type
      primitive String
      size 655350
      lazy true
       
      def self.load(value, property)
        if value.nil?
          nil
        elsif value.is_a?(String) && !value.empty?
          parsed_graph = Reddy::N3Parser.new(value).graph
          def parsed_graph.with(n3)
            o = to_ntriples
            o = o + n3
          end
          return parsed_graph
        else
          raise ArgumentError.new("+value+ must be nil or a String")
        end
      end
      
      def self.dump(value, property)
        return nil if value.nil?
        value.to_s
      end
    end # class RDFGraph
  end # module Types
end # module DataMapper