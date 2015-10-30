require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'
require 'byebug'
require 'capybara-screenshot/cucumber'

Capybara.default_driver = :selenium

class Word
  def generate_word
    @word = Faker::Hacker.noun
  end
end

class GoogleHome < SitePrism::Page
    set_url "http://www.google.com/en"
    element :search_field, "input[name='q']"
    element :search_button, "button[name='btnG']"
end

class Wiki < SitePrism::Page
    element :heading, "#firstHeading"
end

class GoogleResults < SitePrism::Page
    set_url_matcher /google.com\/results\?.*/
    elements :result_links, ".r>a"

    def find_wiki_links
        self.all(:css, ".r>a[href*='wikipedia']").map { |l| l[:href] }.uniq
    end
end


Given /^a word for search and Google web-page$/ do
    p @example = Word.new.generate_word
    @page = GoogleHome.new
    @page.has_search_field?
    @page.has_search_button?
    @page.load
end
When /^I ask Google to find something about my word$/ do
    @page.search_field.set @example
    @page.search_button.click

end
Then /^I get some results$/ do
    @res_page = GoogleResults.new
    @res_page.displayed?
    @res_page.has_result_links?
end

Then /^I go to Wiki page(s) containing information about that word and make a screenshot$/ do
    @wiki_links = res_page.find_wiki_links
    @wiki_links.each_with_index do |link, index|
        visit link
        @wiki = Wiki.new
        @wiki.heading.text.downcase.include? @example
        @wiki.save_screenshot("wikipage_#{@wiki.heading.text}_#{Time.now}")
    end
end

When /^I go to the first web site from given results, but non Wiki-page$/ do
    byebug
    visit @res_page.result_links.map{|l| l[:href]}.delete_if{|l| l.downcase.include?('wikipedia')}.first
    save_screenshot("#{}")
end


