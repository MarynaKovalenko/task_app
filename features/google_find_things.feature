Feature: Google finds things

In order to get some knowledge about a sought-for thing
As a user of Google search engine
I want Google to find me information about that thing

# Scenario: Result from Wiki
# Given a word for search and Google web-page
# When I ask Google to find something about my word
# Then I get some results
# Then I go to Wiki page(s) containing information about that word and make a screenshot



Scenario: Result not from Wiki
Given a word for search and Google web-page
When I ask Google to find something about my word
Then I get some results
When I go to the first web site from given results, but non Wiki-page
# Then I make a screenshot of this page if description of sought-for word is correct


