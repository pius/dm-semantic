module DataMapper
  module Semantic
      module ClassMethods

        ## 
        # Returns a hash of the ontologies to which the model is mapped, along with their authoritative URIs.
        #
        # ==== Example
        #   Person.ontologies # returns {:foaf => "http://xmlns.com/foaf/spec/"}
        #   Person.ontologies(:rdf) # returns {:foaf => "http://xmlns.com/foaf/spec/index.rdf"}
        #
        # @param [Symbol] format format of the ontology to which the URI points (:rdf, :turtle, or :json).  Defaults to :rdf
        #
        # ==== Returns
        # @return [String] the OWL ontology in the requested format.
        #
        # @author Pius Uzamere
        #---
        # @public

        def ontologies(format = :rdf)
          raise "Not Yet Implemented"
        end
        
        ## 
        # Export the entire class definition as an OWL ontology.
        #
        # ==== Example
        #   Person.to_owl # returns string representation of the OWL ontology in Turtle.
        #   Person.to_owl(:json) # returns string representation of the OWL ontology in RDF-JSON.
        #
        # @param [Symbol] format format of the OWL-RDF output (:xml, :turtle, or :json).  Defaults to :turtle
        # ==== Rules for creating the ontology
        # The class itself will be represented by a b-node.
        #
        # ==== Returns
        # @return [String] the OWL ontology in the requested format.
        #
        # @author Pius Uzamere
        #---
        # @public

        def to_owl(*args)
          g = Graph.new
          owl = Namespace.new('http://www.w3.org/2002/07/owl', 'owl', true)
          foaf = Namespace.new("http://xmlns.com/foaf/0.1/", "foaf")
          rdf = Namespace.new("http://www.w3.org/1999/02/22-rdf-syntax-ns", "rdf", true)
          rdfs = Namespace.new("http://www.w3.org/2000/01/rdf-schema", 'rdfs', true)
          xsd = Namespace.new('http://www.w3.org/2001/XMLSchema', 'xsd', true)
  
          for property in properties
            g << Triple.new(BNode.new('john'), foaf.knows, BNode.new('jane'))
          end
          return g
        end
        
        ## 
        # Create the basic OWL triples for the class, without the properties.
        #
        # ==== Example
        #   Person.triple_for_class_definition # returns a graph of the triples representing the bare class in OWL.
        #
        # ==== Rules for creating the ontology
        # The class itself will be represented by a b-node.
        #
        # ==== Returns
        # @return [Graph] graph of the OWL triples for the bare class.
        #
        # @author Pius Uzamere
        #---
        # @public
        
        def triples_for_class_definition
          declare_namespaces
          g = Graph.new
          b = BNode.new(self.name)
          g << Triple.new(b, URIRef.new('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), URIRef.new('http://www.w3.org/2002/07/owl#Class'))
          return g
        end
        
        ## 
        # Create the OWL triples for a DataMapper property.
        #
        # ==== Example
        #   Person.triples_for_property(Person.properties[:id]) # returns a graph of the triples representing the id property on Person in OWL.
        #
        #
        # ==== Returns
        # @return [Graph] graph of the OWL triples for the property.
        #
        # @author Pius Uzamere
        #---
        # @public
        
        def triples_for_property(property)
          g = Graph.new
          b = BNode.new(property.field)
          t = Triple.new(b, URIRef.new('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'), URIRef.new('http://www.w3.org/2002/07/owl#DatatypeProperty'))
          g << t
          return g
        end
        
        protected
        
        ## 
        # Utility method to declare a bunch of useful namespaces.
        #
        # ==== Example
        #   Person.declare_namespaces # instantiates some useful namespaces.
        #
        # @author Pius Uzamere
        #---
        # @protected
        
        def declare_namespaces
          foaf = Namespace.new("http://xmlns.com/foaf/0.1/", "foaf")
          rdf = Namespace.new("http://www.w3.org/1999/02/22-rdf-syntax-ns", "rdf", true)
          rdfs = Namespace.new("http://www.w3.org/2000/01/rdf-schema", 'rdfs', true)
          xsd = Namespace.new('http://www.w3.org/2001/XMLSchema', 'xsd', true)
          owl = Namespace.new('http://www.w3.org/2002/07/owl', 'owl', true)
        end
        
    end

    
    module InstanceMethods
        
        ## 
        # Export a representation of the instance in RDF.
        #
        # ==== Example
        #   Friend.first.to_rdf # returns the first Friend model instance in RDF using its ontology
        #
        # @param [Symbol] format format of the OWL-RDF output (:xml, :turtle, or :json).  Defaults to :turtle
        #
        # ==== Returns
        # @return [String] the RDF representation in the requested serialization format.
        #
        # @author Pius Uzamere
        #---
        # @public
        
         def to_rdf(format = :xml)
           raise "not yet implemented"
         end
    end
    
    private
    
    def self.included(receiver)
      receiver.extend(ClassMethods)
      receiver.send :include, InstanceMethods
    end
    
  end
end
