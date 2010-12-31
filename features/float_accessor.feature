Feature: Getting floats from the document
  In order to provide simpler way of getting floats from a node
  As a traverser
  I want to access nodes using the float method and an xpath
  
  Scenario: getting the float of a single node
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
        </root>
      """
    And I call "float('/root/average_price')" on the document
    Then the result should be 20.32
    
  Scenario: getting the float of a single node with whitespace
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>
            20.32
          </average_price>
          <number_of_beers>2</number_of_beers>
        </root>
      """
    And I call "float('/root/average_price')" on the document
    Then the result should be 20.32
    
  Scenario: getting a non-existent node
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
        </root>
      """
    Then calling "float('//something/missing')" on the document should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node
    