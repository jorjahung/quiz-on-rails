Feature: Users
	
	Background:
		Given I am at the signup form

	Scenario: User signing up
		When I click signup
		Then I can see my name

	Scenario: Unique username
		When I signup with a non unique username
		Then I get 'Username has already been taken'

	Scenario: Has a password
		When I signup without a password
		Then I get 'no password'