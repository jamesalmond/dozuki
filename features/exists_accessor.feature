Feature: Exists accessor
  In order to easily determine whether a node exists in a document
  As a traverser
  I want to check whether a node exists
  
  
  Scenario: the node exists
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    And I call "exists?('/root/number_of_rooms')" on the document
    Then the result should be true
    
  Scenario: the node doesn't exist
    When I parse the XML:
      """
        <root>
          <hotel>lame</hotel>
          <cost>20.00</cost>
          <number_of_rooms>2</number_of_rooms>
        </root>
      """
    And I call "exists?('/root/quantity')" on the document
    Then the result should be false