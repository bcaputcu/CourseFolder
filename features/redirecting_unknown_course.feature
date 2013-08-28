Feature: Redirecting unknown course
	In order to show less error pages
	As a user
	I should see a new course form in an empty course's page

	Background:
		Given I am signed in

	Scenario: Redirecting user to course index page
		When I go to an empty course's page
		Then I should see new course form
		And I should be on new course page