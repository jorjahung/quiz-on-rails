Feature: User's answer

	Background: 
		Given there is a question
		And there is a user signed in
		And I am in the homepage


	Scenario: User answers a question
		When I click on true
		Then I should see my answer recorded

	Scenario: User has a score
		When I click on the correct answer
		Then I should see my score
