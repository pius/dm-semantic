class Cow
  include DataMapper::Resource
  include DataMapper::Semantic
 
  property :id, Integer, :key => true
  property :composite, Integer, :key => true
  property :name, String
  property :breed, String
  
  def serialize_properties
    {:extra => "Extra", :another => 42}
  end
end