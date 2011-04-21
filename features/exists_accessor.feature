Feature: Exists accessor
  In order to easily determine whether a node exists in a document
  As a traverser
  I want to check whether a node exists

  Scenario: the node exists
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
        </root>
      """
    And I call "exists?('/root/number_of_beers')" on the document
    Then the result should be true

  Scenario: the node doesn't exist
    When I parse the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
        </root>
      """
    And I call "exists?('/root/food')" on the document
    Then the result should be false
