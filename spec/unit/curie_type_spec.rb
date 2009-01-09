require 'pathname'
require Pathname(__FILE__).dirname.parent.expand_path + 'spec_helper'

describe DataMapper::Types::Curie do

  before(:each) do
    @c = Curie.new("foaf", "knows")   
    @curie_string = "[foaf:knows]"
  end

  describe ".dump" do
    it "should return the Curie as a string representing it" do
      DataMapper::Types::Curie.dump(@c, :property).should == @curie_string
    end

    it "should return nil if the string is nil" do
      DataMapper::Types::Curie.dump(nil, :property).should be_nil
    end

    it "should return a nil if the string is empty" do
      DataMapper::Types::Curie.dump("", :property).should be_nil
    end
  end
  
  describe ".load" do
    it "should return the Curie string as a Curie object" do
      DataMapper::Types::Curie.load(@curie_string, :property).should == @c
    end

    it "should return nil if given nil" do
      DataMapper::Types::Curie.load(nil, :property).should be_nil
    end

    it 'should raise an ArgumentError if given something else' do
      lambda {
        DataMapper::Types::Curie.load([], :property)
      }.should raise_error(ArgumentError, "+value+ must be nil or a String representing a sane Curie")
    end
  end


end
