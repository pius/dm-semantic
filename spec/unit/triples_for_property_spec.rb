require 'pathname'

require Pathname(__FILE__).dirname.expand_path.parent + 'spec_helper'

describe DataMapper::Semantic, '#triples_for_property' do
  
  it "should return an RDF Graph, given a DM property" do
    prop = Cow.properties[:id]
    prop.field.should == 'id'
    g = Cow.triples_for_property(prop)
    g.class.should == Graph
  end

  it "should create an OWL Datatype Property for a DM property" do
    prop = Cow.properties[:id]
    g = Cow.triples_for_property(prop)  
    g.size.should == 1
    g.has_bnode_identifier?('id').should == true
    g.each_with_subject('_:id') do |t|
      t.object.should == URIRef.new('http://www.w3.org/2002/07/owl#DatatypeProperty')
    end
  end
  
end
