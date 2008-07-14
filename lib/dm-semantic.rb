require 'rubygems'

gem 'dm-core', '=0.9.3'
require 'dm-core'

gem 'pius-rena'
require 'rena'

dir = Pathname(__FILE__).dirname.expand_path / 'dm-semantic'

require dir / 'functions'
require dir / 'model'
