Feature: Creating Notes
	In order to store my notes online
	As a user
	I want to be able to create new notes

	Background:
		Given I am signed in
		And I go to my dashboard

	Scenario: Go to the new note page
		When I go to create note
		Then I should be on new note page