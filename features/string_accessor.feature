Feature: Getting strings from the document
  In order to provide simpler way of getting strings from a node
  As a traverser
  I want to access nodes using the string method and an xpath
  
  Scenario: getting the string of a single node
    When I parse the XML:
      """
        <root>
          <hotel>St George's</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    And I call "string('/root/hotel')" on the document
    Then the result should be "St George's"
    
  Scenario: getting the text of a single node with whitespace
    When I parse the XML:
      """
        <root>
          <hotel>
            St George's
          </hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    And I call "string('/root/hotel')" on the document
    Then the result should be "St George's"
    
  Scenario: getting a non-existent node
    When I parse the XML:
      """
        <root>
          <hotel>St George's</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    Then calling "string('//something/missing')" on the document should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node