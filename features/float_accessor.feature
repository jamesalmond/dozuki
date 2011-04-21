Feature: Getting floats from the document
  In order to provide simpler way of getting floats from a node
  As a traverser
  I want to access nodes using the float method and an xpath

  Background:
    Given I have parsed the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <highest_price>
            30.33
          </highest_price>
          <number_of_beers>2</number_of_beers>
        </root>
      """

  Scenario: getting the float of a single node
    When I call "float('/root/average_price')" on the document
    Then the result should be 20.32

  Scenario: getting the float of a single node with whitespace
    When I call "float('/root/highest_price')" on the document
    Then the result should be 30.33

  Scenario: getting the int of a node that doesn't contain a float
    When I call "float('/root/name')" on the document
    Then it should raise an "InvalidFormat" error
    And the error should have the value "St. George's Arms"
    And the error should have the format "float"

  Scenario: getting a non-existent node
    When I call "float('//something/missing')" on the document
    Then it should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node

