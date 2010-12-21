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
    And I get the xpath "//rooms"
    Then the node should be a "Dozuki::XML::Node"
    Then the node should have 2 elements

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
    And I get the xpath "//rooms" with a block
    Then the node should be a "Dozuki::XML::Node"
    Then the node should have 2 elements
    
  Scenario: it gets the first of multiple nodes
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
    And I get the xpath "//rooms/room"
    Then the node should have the text "SINGLE"
    
  Scenario: getting a non-existent node
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    Then getting the xpath "//something/missing" should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node