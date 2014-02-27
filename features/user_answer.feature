Feature: User's answer

	Background: 
		Given there is a question
		And there is a user


	Scenario: user answer's a question
		Given I am in the homepage
		When I click on true
		Then I should see my answer recorded
