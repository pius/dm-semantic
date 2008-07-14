require 'pathname'

require Pathname(__FILE__).dirname.expand_path.parent + 'spec_helper'

describe DataMapper::Semantic, '#create_triples_for_class_definition' do
  
  it "should return an RDF Graph" do
    owl = BoringThing.triples_for_class_definition
    owl.class.should == Graph
  end

  it "should create a barebones OWL class definition from an empty class with no ancestors" do
    owl = BoringThing.triples_for_class_definition
    owl.size.should == 1
    owl.has_bnode_identifier?(BoringThing.name).should == true
    owl.each_with_subject('_:BoringThing') do |t|
      t.predicate.should == URIRef.new('http://www.w3.org/1999/02/22-rdf-syntax-ns#type')
    end
  end
  
  it "should create a barebones OWL class definition from an empty class with an ancestor"

end
