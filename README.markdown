= Dozuki

A Nokogiri wrapper that simplifies commonly occurring tasks.

[![Build Status](http://travis-ci.org/JamesAlmond/dozuki.png)](http://travis-ci.org/JamesAlmond/dozuki)

== What does it do?

Dozuki removes the repetitive tasks from parsing XML documents with XPaths such as:

* extracting ints, floats, strings etc.
* accessing single nodes
* checking whether an element exists
* iterating through nodes
* iterating nodes and extracting ints, floats and strings etc.

It's mainly sugar for reducing the amount of chaining on calls like:

  doc.xpath('/my/xpath').first.to_i

== How do I use it?

Parsing XML (currently only supports strings):

  doc = Dozuki::XML.parse(xml_string)

This documents supports the Dozuki extensions for:

=== Extracting a single node

The get methods takes an xpath and returns the first node that matches the xpath:

  doc.get('/my/xpath')

If the node can't be found then an exception is raised.

=== Extracting a single node of a certain type

The following methods take the first node that matches the xpath and returns the formatted result:

  doc.string('/my/xpath') # surrounding whitespace stripped
  doc.float('/my/xpath')
  doc.int('/my/xpath')

These functions are to replace calls using plain Nokogiri such as:

  doc.xpath('/my/xpath').first.to_i

=== Checking whether an element exists

  doc.exists?('/my/xpath')

=== Iterating through nodes

Dozuki also provides a slightly more succinct way to 'each' an xpath:

  doc.each('/my/xpath') do |node|
    # do something
  end

=== Iterating through node text and parsing

There are also simple ways to extract formatted text of a series of nodes with an each

  doc.each('/my/xpath').as_string do |node|
    # string with surrounding whitespace stripped
  end
  
  doc.each('/my/xpath').as_int do |node|
    # int
  end
  
  doc.each('/my/xpath').as_float do |node|
    # float
  end

== Playing nicely with Nokogiri

Dozuki will proxy any calls not recognised onto the underlying Nokogiri structure, including responds_to?, allowing you to treat it like any other Nokogiri document.

== More documentation

More features are described in the.. {features}[https://github.com/jamesalmond/dozuki/tree/master/features]

== Contributing to Dozuki
 
* Fork the project.
* Add tests that cover the new feature or bug fix.
* Make your feature addition or bug fix.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself in another branch so I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

== LICENSE:

(The MIT License)

Copyright (c) 2010:

* {James Almond}[http://jamesalmond.com]

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
