Feature: Signing in
	In order to access my account
	As a user
	I want to be able to sign in

	Background:
		Given a user exists

	Scenario: Signing in
		When I sign in as a user
		Then I should be signed in
