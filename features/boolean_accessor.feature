Feature: Getting booleans from the document
  In order to provide simpler way of getting booleans from a node
  As a traverser
  I want to access nodes using the boolean method and an xpath

  Background:
    Given I have parsed the XML:
      """
        <root>
          <name>St. George's Arms</name>
          <open>1</open>
          <licensed>
            0
          </licensed>
          <clean>
            true
          </clean>
          <worth_visiting>false</worth_visiting>
        </root>
      """

  Scenario: getting the boolean of a 1 single node
    When I call "boolean('/root/open')" on the document
    Then the result should be true

  Scenario: getting the boolean of a 0 single node with whitespace
    When I call "boolean('/root/licensed')" on the document
    Then the result should be false

  Scenario: getting the boolean of a true single node with whitespace
    When I call "boolean('/root/clean')" on the document
    Then the result should be true

  Scenario: getting the boolean of a false single node with whitespace
    When I call "boolean('/root/worth_visiting')" on the document
    Then the result should be false

  Scenario: getting a non-existent node
    When I call "float('//something/missing')" on the document
    Then it should raise a "NotFound" error
    And the error should have the xpath "//something/missing"
    And the error should have a stored node

