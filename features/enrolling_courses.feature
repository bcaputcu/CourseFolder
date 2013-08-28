Feature: Enrolling Courses
	In order to be a course member
	As a user
	I want to enroll to an existing course
	
	Background:
		Given a course exists
		And I am signed in

	Scenario: Enroll to an existing course from course page
		When I enroll to that course
		Then I should be a member of that course
		And I should be on that course's page