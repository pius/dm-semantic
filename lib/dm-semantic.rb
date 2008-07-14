require 'rubygems'

gem 'dm-core', '=0.9.3'
require 'dm-core'

gem 'rena'
require 'rena'

dir = Pathname(__FILE__).dirname.expand_path / 'dm-semantic'

require dir / 'functions'
require dir / 'model'
# require dir / 'repository'
# require dir / 'collection'
# require dir / 'adapters' / 'data_objects_adapter'
