Feature: session

	Background:
		Given I have a username and password

	Scenario: Signing in
		Given I am in the signin page
		When I input the correct username and password
		Then I get signed in
	
