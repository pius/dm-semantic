require 'pathname'
require Pathname(__FILE__).dirname.parent.expand_path + 'spec_helper'

describe DataMapper::Types::RDFGraph do

  before(:each) do
    t1 = Triple.new("<http://pius.github.com#me>", "<http://xmlns.com/foaf/0.1/name>", "\"Pius Uzamere\"")
    t2 = Triple.new("<http://pius.github.com#me>", "<http://xmlns.com/foaf/0.1/homepage>", "<http://pius.github.com>")
    @graph = Graph.new
    @graph << t1
    @graph << t2
    
    @triple_string = "<http://pius.github.com#me> <http://xmlns.com/foaf/0.1/name> \"Pius Uzamere\" . 
    <http://pius.github.com#me> <http://xmlns.com/foaf/0.1/homepage> <http://pius.github.com> ."
  end

  describe ".dump" do
    it "should return the graph as a string of NTriples" do
      DataMapper::Types::RDFGraph.dump(@graph, :property).strip.should == @triple_string.strip
    end

    it "should return nil if the string is nil" do
      DataMapper::Types::RDFGraph.dump(nil, :property).should be_nil
    end

    it "should return an empty graph if the string is empty" do
      DataMapper::Types::RDFGraph.dump("", :property).should == Graph.new
    end
  end
  
  describe ".load" do
    it "should return the string of NTriples as a Graph object" do
      DataMapper::Types::RDFGraph.load(@triple_string, :property).should == @graph
    end

    it "should return nil if given nil" do
      DataMapper::Types::RDFGraph.load(nil, :property).should be_nil
    end

    it "should return an empty Graph if given an empty string" do
      DataMapper::Types::RDFGraph.load("", :property).should == Reddy::Graph.new
    end

    it 'should raise an ArgumentError if given something else' do
      lambda {
        DataMapper::Types::RDFGraph.load([], :property)
      }.should raise_error(ArgumentError, '+value+ must be nil or a String')
    end
  end


end
