Feature: Getting integers from the document
  In order to provide simpler way of getting integers from a node
  As a traverser
  I want to access nodes using the int method and an xpath

  Background:
    Given I have parsed the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <average_price>20.32</average_price>
          <number_of_beers>2</number_of_beers>
          <number_of_ciders>
            5
          </number_of_ciders>
        </root>
      """

  Scenario: getting the int of a single node
    When I call "int('/root/number_of_beers')" on the document
    Then the result should be 2

  Scenario: getting the int of a single node with whitespace
    When I call "int('/root/number_of_ciders')" on the document
    Then the result should be 5

  Scenario: getting the int of a node that doesn't contain an int
    When I call "int('/root/name')" on the document
    Then it should raise an "InvalidFormat" error
    And the error should have the value "St. George's Arms"
    And the error should have the format "int"

  Scenario: getting the int of a non-existent node
    When I call "int('//something/missing')" on the document
    Then it should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node
