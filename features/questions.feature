Feature: Questions

  Scenario: Listing Questions
		Given there is a question
		When I visit the homepage
		Then I should see a question

	Scenario: Showing Answer
		Given there is a question
		When I visit the homepage
		And I click correct answer
		Then I should see 'correct'

	Scenario: New Question
		Given I want to create a new question
		When I submit the form
		Then I can see it in the homepage
		And I see a notice that it has been saved