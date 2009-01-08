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

3. **Require the gem and include it in your DataMapper models**

To use the special RDFGraph type, create a property with the type in your model.  For example:

  > property :graph, RDFGraph
  
4.  Now, you can use RDF in your model.  For example:


      c = Concept.new(:slug => "pius", :graph => "<http://pius.github.com#me> <http://xmlns.com/foaf/0.1/name> \"Pius Uzamere\" . 
      <http://pius.github.com#me> <http://xmlns.com/foaf/0.1/homepage> \"Pius Uzamere\" .")
      #<Concept id=nil slug="pius" graph="<http://pius.github.com#me> <http://xmlns.com/foaf/0.1/name> \"Pius Uzamere\" . \n<http://pius.github.com#me> <http://xmlns.com/foaf/0.1/homepage> \"Pius Uzamere\" .">
      >> c.save
      ~ (0.000087) SELECT "id", "slug" FROM "concepts" WHERE ("slug" = 'pius') ORDER BY "id", "slug" LIMIT 1
      ~ (0.002364) INSERT INTO "concepts" ("graph", "slug") VALUES ('<http://pius.github.com#me> <http://xmlns.com/foaf/0.1/name> "Pius Uzamere" . 
    <http://pius.github.com#me> <http://xmlns.com/foaf/0.1/homepage> "Pius Uzamere" .', 'pius')
      => true
      >> exit

Then, later:

  >> c = Concept.first
  ~ (0.000086) SELECT "id", "slug" FROM "concepts" ORDER BY "id", "slug" LIMIT 1
  => #<Concept id=4 slug="pius" graph=<not loaded>>
  >> c.graph
  ~ (0.000084) SELECT "graph", "id", "slug" FROM "concepts" WHERE ("id" = 4) AND ("slug" = 'pius') ORDER BY "id", "slug"
  => #<Reddy::Graph:0x2742a3c @nsbinding={}, @triples=[[#<Reddy::URIRef:0x274262c @uri=#<Addressable::URI:0x13a0d1c URI:http://pius.github.com#me>, #<Reddy::URIRef:0x27415b0 @uri=#<Addressable::URI:0x13a03da URI:http://xmlns.com/foaf/0.1/name>, #<Reddy::Literal:0x27404f8 @encoding=<theReddy::TypeLiteral::Encoding::Null>, contents"Pius Uzamere"], [#<Reddy::URIRef:0x2742690 @uri=#<Addressable::URI:0x13a0024 URI:http://pius.github.com#me>, #<Reddy::URIRef:0x273fc10 @uri=#<Addressable::URI:0x139fc5a URI:http://xmlns.com/foaf/0.1/homepage>, #<Reddy::Literal:0x273f670 @encoding=<theReddy::TypeLiteral::Encoding::Null>, contents"Pius Uzamere"]]
  
4. **Read the documentation**

It's YARD.  It's sexy.

5. **Contribute!**

Fork my repository (http://github.com/pius/dm-semantic), make some changes, and send along a pull request!
                                                                              

COPYRIGHT
---------                                                                 

DM-Semantic was created in 2008 by Pius Uzamere (pius -AT- alum -DOT- mit -DOT- edu) and is    
licensed under the MIT license.
