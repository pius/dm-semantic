Gem::Specification.new do |s|
  s.name = "dm-semantic"
  s.version = "0.0.2"
  s.date = "2009-01-08"
  s.summary = "DM-Semantic is a DataMapper plugin for adding semantic capabilities to models."
  s.email = "pius+github@alum.mit.edu"
  s.homepage = "http://github.com/pius/dm-semantic"
  s.description = "DM-Semantic is a DataMapper plugin for adding semantic capabilities to models."
  s.has_rdoc = true
  s.authors = ["Pius Uzamere"]
  s.files = ["README.markdown", "Rakefile", "dm-semantic.gemspec", "lib/dm-semantic.rb", "lib/dm-semantic/functions.rb", "lib/dm-semantic/model.rb", "lib/dm-semantic/types.rb"]
  s.test_files = ["spec/spec_helper.rb"]
  #s.rdoc_options = ["--main", "README.txt"]
  #s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.add_dependency("dm-types", ["> 0.9.6"])
  s.add_dependency("reddy", ["> 0.0.1"])
end