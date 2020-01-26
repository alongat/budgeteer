# frozen_string_literal: true

# typed: true
require 'roo'

module Scrapers
  class DiscountBank < Scraper
    extend T::Sig
		def scrape 
			options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])

			driver = Selenium::WebDriver.for(:chrome, options: options)
	
			driver.get('https://start.telebank.co.il/apollo/core/templates/lobby/masterPage.html?t=P&amp;bank=D&amp;u1=false&amp;multilang=he#/LOGIN_PAGE')
			
			wait = Selenium::WebDriver::Wait.new(:timeout => 10)
			wait.until { driver.title.start_with? "כניסה לחשבונות שלי" }
			
			driver.find_element(id: 'tzId').send_keys('')
			driver.find_element(id: 'tzPassword').send_keys('')
			driver.find_element(id: 'aidnum').send_keys('')
	
			driver.find_element(xpath: "//*[@class='sendBtn ng-isolate-scope']").click
			from_date = 20191001
			to_date = 20191031
			driver.get("https://start.telebank.co.il/Titan/gatewayAPI/lastTransactions/transactions/0125709961/ByDate?FromDate=#{from_date}&ToDate=#{to_date}")
			ap JSON.parse driver.find_element(xpath: "//*").text
	
			driver.quit
		end
  end
end
