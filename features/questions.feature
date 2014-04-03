Feature: Questions

	Background:
		Given there is a question

    Scenario: Listing Questions
		When I visit the homepage
		Then I should see a question

	Scenario: Showing Answer
		When I visit the homepage
		And I click correct answer
		Then I should see 'correct'

	Scenario: New Question
		Given I want to create a new question
		When I submit the form
		Then I can see it in the homepage
		And I see a notice that it has been saved

