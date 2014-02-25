Feature: Questions

  Scenario: Listing Questions
		Given there is a question
		When I visit the homepage
		Then I should see a question

	Scenario: Showing Answer
		Given there is a question
		When I visit the homepage
		Then I should see an answer

