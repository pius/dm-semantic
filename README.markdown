DM-Semantic Release 0.0.1 (July 13th 2008) 
===================================

**Git**:  [http://github.com/pius/dm-semantic](http://github.com/pius/dm-semantic)   
**Author**:    Pius Uzamere, The Uyiosa Corporation
**Copyright**: 2008


SYNOPSIS
--------

DM-Semantic is a plugin for DataMapper that will allow you to seamlessly export your data models as OWL ontologies 
and expose your data as RDF.


FEATURE LIST
------------
                                                                              
1. **Data Model Export as OWL Ontology**: You've already done the hard work coming up with your schema.  Now 
you can make it even more useful by enabling OWL-aware clients to process it as a formally specified ontology.
DataMapper is a great host for this capability because, rather than introspecting for the model fields, it not 
only requires the developer to explicitly state the properties, but allows for rich specification of these 
properties including cardinality and complex datatypes.  These features map nicely to the expressiveness of OWL.

2. **Data Export as RDF**: You've got a ton of data in your database.  Let your data do more for you by exporting 
it as RDF so that Semantic Web clients can mash it up with other data sources.

USAGE
-----

First of all, it's worth noting that this library isn't ready to use.  If you insist on using it, then you'll need to do the following:

1. **Install the Gem**

Make sure you've upgraded to RubyGems 1.2.  Then, if you've never installed a gem from GitHub before then do this:

  > gem sources -a http://gems.github.com (you only have to do this once)

Then:

  > sudo gem install pius-dm-semantic

2. **Make Sure You've Got the Dependencies installed**

DM-Semantic depends on Rena (http://github.com/tommorris/rena).  Use my version, to be safe.

  > sudo gem install pius-rena

3. **Require the gem and include it in your DataMapper models**

After requiring the gem, put this in the DataMapper models you'd like to semantify:

  > include DataMapper::Semantic

4. **Read the documentation**

It's YARD.  It's sexy.

5. **Contribute!**

Fork my repository (http://github.com/pius/dm-semantic), make some changes, and send along a pull request!
                                                                              

COPYRIGHT
---------                                                                 

DM-Semantic was created in 2008 by Pius Uzamere (pius -AT- alum -DOT- mit -DOT- edu) and is    
licensed under the MIT license.
