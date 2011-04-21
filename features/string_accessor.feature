Feature: Getting strings from the document
  In order to provide simpler way of getting strings from a node
  As a traverser
  I want to access nodes using the string method and an xpath

  Background:
    Given I have parsed the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <address>
            1 Main Street
          </address>
          <number_of_beers>2</number_of_beers>
        </root>
      """

  Scenario: getting the string of a single node
    When I call "string('/root/name')" on the document
    Then the result should be "St. George's Arms"

  Scenario: getting the text of a single node with whitespace
    When I call "string('/root/address')" on the document
    Then the result should be "1 Main Street"

  Scenario: getting a non-existent node
    When I call "string('//something/missing')" on the document
    Then it should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node
