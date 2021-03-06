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
		Then I get 'Password can't be blank'

	Scenario: User can't see own question
		Given I am signed in
		When I visit the homepage
		Then I should not see my questions

	