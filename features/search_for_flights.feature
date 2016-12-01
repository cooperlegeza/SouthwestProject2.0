Feature: Searching for flights

  Scenario: Searching using the default dates
    When I search for a flight using the default
    Then the dates I searched for are highlighted in the search results
    And I can't choose a departure date from the past
