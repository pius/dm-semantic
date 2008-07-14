require 'pathname'


require Pathname(__FILE__).dirname.expand_path.parent + 'spec_helper'

describe DataMapper::Semantic, '#to_owl' do


  before(:all) do
    query = DataMapper::Query.new(DataMapper::repository(:default), Cow)

    @collection = DataMapper::Collection.new(query) do |c|
      c.load([1, 2, 'Betsy', 'Jersey'])
      c.load([10, 20, 'Berta', 'Guernsey'])
    end

    @empty_collection = DataMapper::Collection.new(query) {}
  end
  
  it "should return an RDF Graph" do
    owl = BoringThing.to_owl
    owl.class.should == Graph
  end

  it "should export the class definition to an OWL ontology"


end
