DM-Semantic Release 0.0.2 (January 8th 2009) 
===================================

**Git**:  [http://github.com/pius/dm-semantic](http://github.com/pius/dm-semantic)   
**Author**:    Pius Uzamere, The Uyiosa Corporation

**Copyright**: 2009


SYNOPSIS
--------

DM-Semantic is a plugin for DataMapper that will allow you to seamlessly export your data models as OWL ontologies and expose your data as RDF.


FEATURE LIST
------------
                                                                              
1. **Import and Export RDF Data Directly From Your Models**: DM-Semantic adds a special DataMapper Type called RDFGraph.  You can add properties with this type to your DataMapper models and transparently load and dump RDF triples to your models (in Ntriples form.)  Let your data do more for you by manipulating it as RDF so that you can mash it up with other data sources and inference across the data.

USAGE
-----

1. **Install the Gem**

Make sure you've upgraded to at least RubyGems 1.2.  Then, if you've never installed a gem from GitHub before then do this:

  > gem sources -a http://gems.github.com (you only have to do this once)

Then:

  > sudo gem install pius-dm-semantic

2. **Make Sure You've Got the Dependencies installed**

DM-Semantic depends on Reddy (http://github.com/tommorris/reddy).

  > sudo gem install reddy

3. **Require the gem**
  
4.  Now, you can use RDF in your model.  See specs for examples.

To use the special RDFGraph type, create a property with the type in your model.  For example:

  > property :graph, RDFGraph
  
5. **Read the documentation**

It's YARD.  It's sexy.

6. **Contribute!**

Fork my repository (http://github.com/pius/dm-semantic), make some changes, and send along a pull request!
                                                                              

COPYRIGHT
---------                                                                 

DM-Semantic was created in 2008 by Pius Uzamere (pius -AT- alum -DOT- mit -DOT- edu) and is    
licensed under the MIT license.
