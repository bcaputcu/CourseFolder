Feature: Signing up
	In order to have an account
	As a user
	I want to be able to sign up

	Background:
		Given a user exists
	
	Scenario: Signing up with unique email address
		When I sign up as another user
		Then there should be 2 users
		And another user should be signed in

	Scenario: Signing up with existing email address
		When I sign up as an existing user
		Then there should be 1 users
		And I should not be signed in