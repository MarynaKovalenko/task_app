require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'random-word'

Capybara.default_driver = :selenium

class Word
  def generate_word
    @word = RandomWord.nouns.next
  end
end

class Google < SitePrism::Page
    set_url "http://www.google.com"
    element :search_field, "input[name='q']"
    element :search_button, "button[name='btnG']"
end

class Wiki < SitePrism::Page
    element
end

class SearchResults < SitePrism::Page
    set_url_matcher /google.com\/results\?.*/
    # section :menu, MenuSection,"#gbx3"
    # sections :search_results, SearchResultSection, "#results li"
end


Given /^a word for search$/ do
    @example = Word.new.generate_word
end
When /^I go to Google web site and ask Google to find something about my word$/ do
    @page = Google.new
    @page.load
    @page.search_field.set @example
    @page.search_button.click

end
Then /^I find a Wikipedia page among results$/ do
    @res_page = SearchResults.new
    expect(@res_page).to be_displayed
    expect(@res_page.search_result_links).to include "http://en.wikipedia.org/wiki/#{@example}"
end
And /^go Wiki page$/ do
    @wiki = Wiki.new

end
Then /^I make a screenshot of this page iff description of soughtfor word is correct$/ do
end



