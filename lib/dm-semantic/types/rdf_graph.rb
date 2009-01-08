require 'reddy'

class Reddy::Graph
  def ==(other)
    return false unless other.is_a?(Reddy::Graph)
    return true if (triples == other.triples) && (nsbinding == other.nsbinding) # covers the case of truly identical (or empty) graphs
    #TODO: implement equality for the non-trivial case, merge back into Reddy
    super
  end
end

module DataMapper
  module Types
    class RDFGraph < DataMapper::Type
      primitive String
      size 655350
      lazy true
       
      def self.load(value, property)
        if value.nil?
          nil
        elsif value.is_a?(String) && value.empty?
          Reddy::Graph.new
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
        return Reddy::Graph.new if (value.is_a?(String) && value.blank?)
        value.to_s if value.is_a? String
        value.to_ntriples if value.is_a? Reddy::Graph
      end
    end # class RDFGraph
  end # module Types
end # module DataMapper