Feature: Exploring courses
	In order to find more classes
	As a user
	I want to be able to explore the courses

	Background:
		Given I am signed in
		And 6 courses exist
		And I am on the course index page

	Scenario: Exploring courses
		Then I should see last 5 courses