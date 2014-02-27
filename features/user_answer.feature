Feature: User's answer

	Background: 
		Given there is a question
		And there is a user


	Scenario: User answers a question
		Given I am in the homepage
		When I click on true
		Then I should see my answer recorded

	Scenario: User has a score
		Given I am in the homepage
		When I click on the correct answer
		Then I should see my score
