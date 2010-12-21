Feature: Getting nodes from the document
  In order to provide a unified interface to the xml objects
  As a traverser
  I want to access nodes using the get method and an xpath
  
  Scenario: getting a single node
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
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
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I call "get('//rooms')" on the document with a block
    Then the result should be a "Dozuki::XML::Node"
    And the result should have 2 elements
    
  Scenario: getting the first of multiple nodes
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
          <rooms>
            <room>SINGLE</room>
            <room>Double</room>
          </rooms>
        </root>
      """
    And I call "get('//rooms/room')" on the document with a block
    Then the result should have the text "SINGLE"
    
  Scenario: getting a non-existent node
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    Then calling "get('//something/missing')" on the document should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node
    And the error should have a stored node