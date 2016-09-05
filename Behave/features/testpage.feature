@fast
Feature: page contents

	Scenario: test site is public
		When user opens kentro test page
		Then page body includes jabberwookiee
