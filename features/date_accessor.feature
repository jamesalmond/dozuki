Feature: Getting dates from the document
  In order to provide simpler way of getting dates from a node
  As a traverser
  I want to access nodes using the date method and an xpath

  Background:
    Given I have parsed the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <previous_event>2011-12-02</previous_event>
          <next_event>
            2013-01-12
          </next_event>
        </root>
      """

  Scenario: getting the date of a single node
    When I call "date('/root/previous_event')" on the document
    Then the result should be 02/12/2011

  Scenario: getting the  of a single node with whitespace
    When I call "date('/root/next_event')" on the document
    Then the result should be 12/01/2011

  Scenario: getting the int of a node that doesn't contain a date
    When I call "date('/root/name')" on the document
    Then it should raise an "InvalidFormat" error
    And the error should have the value "St. George's Arms"
    And the error should have the format "date"

  Scenario: getting the date of a non-existent node
    When I call "date('//something/missing')" on the document
    Then it should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node
