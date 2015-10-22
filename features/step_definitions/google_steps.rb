require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

class Word
end

class Google < SitePrism::Page
    set_url "http://www.google.com"
    element :search_field, "input[name='q']"
    element :search_button, "button[name='btnK']"
end

Given /^a word$/ do
    @word = Word.new
end
When /^I go to Google web site$/ do
    @page = Google.new
end
And /^ask Google to find something$/ do
end
Then /^I find a Wikipedia page among search results$/ do
end
And /^go Wiki page$/ do
end
Then /^I make a screenshot of this page iff description of soughtfor word is correct$/ do
end



# class SearchResults < SitePrism::Page
#     set_url_matcher /google.com\/results\?.*/
#     section :menu, MenuSection, "#gbx3"
#     sections :search_results, SearchResultSection, "#results li"
# end
