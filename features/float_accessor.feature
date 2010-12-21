Feature: Getting floats from the document
  In order to provide simpler way of getting floats from a node
  As a traverser
  I want to access nodes using the float method and an xpath
  
  Scenario: getting the text of a single node
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.32</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    And I float the xpath "/root/cost"
    Then the float result should be 20.32
    
    Scenario: getting the text of a single node with whitespace
      When I parse the XML:
        """
          <root>
            <hotel>lame</hotel>
            <cost>
              20.32
            </cost>
            <number_of_rooms>2</number_of_rooms>
          </root>
        """
      And I float the xpath "/root/cost"
      Then the float result should be 20.32
    
  Scenario: getting a non-existent node
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    Then floating the xpath "//something/missing" should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node