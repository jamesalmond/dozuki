Feature: Getting nodes from the document
  In order to provide a unified interface to the xml objects
  As a traverser
  I want to access nodes using the get method and an xpath
  
  Scenario: getting a single node
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I call "get('//rooms')" on the document
    Then the result should be a "Dozuki::XML::Node"
    And the result should have 2 elements

  Scenario: getting a single node but accessing it with a block
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I call "get('//rooms')" on the document with a block
    Then the block parameter should be a "Dozuki::XML::Node"
    And the parameter should have 2 elements
    
  Scenario: getting the first of multiple nodes
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I call "get('//rooms/room')" on the document
    Then the result should have the text "SINGLE"
    
  Scenario: getting a non-existent node
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
        </root>
      """
    Then calling "get('//something/missing')" on the document should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node
    And the error should have a stored node