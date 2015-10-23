Feature: Google finds things

In order to get some knowledge about a sought-for thing
As a user of Google search engine
I want Google to find me information about that thing

Scenario: Result from Wiki
Given a word for search
When I go to Google web site and ask Google to find something about my word
Then I find a Wikipedia page among search results
And go Wiki page
Then I make a screenshot of this page if description of sought-for word is correct


# Scenario: Result not from Wiki
# Given a word for search
# When I go to Google web site and ask Google to find something about my word
# Then I go to the first web site from given results, but not Wiki
# Then I make a screenshot of this page if description of sought-for word is correct


