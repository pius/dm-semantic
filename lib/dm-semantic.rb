require 'pathname'
require 'rubygems'

gem 'dm-core', '~>0.9.8'
require 'dm-core'

gem 'reddy'
require 'reddy'

gem 'curies'
require 'curies'

class Pathname
  def /(path)
    (self + path).expand_path
  end
end # class Pathname

dir = Pathname(__FILE__).dirname.expand_path / 'dm-semantic'

require dir / 'functions'
require dir / 'model'

module DataMapper
  module Types
    dir = (Pathname(__FILE__).dirname.expand_path / 'dm-semantic/types' ).to_s
    autoload :RDFGraph, dir / 'rdf_graph'
    autoload :Curie, dir / 'curie'
  end
end
