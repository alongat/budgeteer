# frozen_string_literal: true

# typed: true

module Scrapers
  class DiscountBank < Scraper
		extend T::Sig
		ACCOUNT_NAME = 'Bank Discount'
		DISCOUNT_LOGIN_URL = 'https://start.telebank.co.il/apollo/core/templates/lobby/masterPage.html?t=P&amp;bank=D&amp;u1=false&amp;multilang=he#/LOGIN_PAGE'
		DISCOUNT_TRANSACTIONS_URL = 'https://start.telebank.co.il/Titan/gatewayAPI/lastTransactions/transactions/0125709961/'

		def login(driver)
			driver.get(DISCOUNT_LOGIN_URL)
			wait = Selenium::WebDriver::Wait.new(:timeout => 10)
			sleep(2)
			driver.find_element(id: 'tzId').send_keys(ENV['DISCOUNT_ACCOUNT_ID'])
			driver.find_element(id: 'tzPassword').send_keys(ENV['DISCOUNT_PASSWORD'])
			driver.find_element(id: 'aidnum').send_keys(ENV['DISCOUNT_ID'])
			driver.find_element(xpath: "//*[@class='sendBtn ng-isolate-scope']").click
		end

		def download_and_save_parsed_data(driver, from_date, to_date) 
			query = "ByDate?FromDate=#{from_date.strftime('%Y%m%d')}&ToDate=#{to_date.strftime('%Y%m%d')}"
			driver.get("#{DISCOUNT_TRANSACTIONS_URL}#{query}")
			json_result = JSON.parse driver.find_element(xpath: "//*").text
			ap json_result 
			file = CSV.open(Rails.root.join('tmp').to_s + "/#{SecureRandom.hex(32)}.csv", 'w', encoding: 'utf-8') do |csv|
				json_result.dig('CurrentAccountLastTransactions', 'OperationEntry').each  do |t|
					csv << [t['ValueDate'], t['OperationDescriptionToDisplay'], t['OperationAmount']]
				end  
			end
			
			filename = "discount_bank_#{from_date.strftime('%Y%m%d')}_#{to_date.strftime('%Y%m%d')}.csv"
			tf = TransactionFile.create!(filename: filename, source: ACCOUNT_NAME, parsed: true)
			tf.files.attach(io: file, filename: filename)
			
			1
		end

		def scrape(from_date=1.month.ago, to_date=Time.now)
			Rails.logger.info 'Scraping Bank Discount!'

			download_dir = "#{Rails.root}/tmp/discountfiles"
			FileUtils.mkdir_p(download_dir) unless File.directory?(download_dir)

			driver = get_driver(download_dir)
			login(driver)
			Rails.logger.info 'Login successful!'

			sleep(3)
			count = download_and_save_parsed_data(driver, from_date, to_date)
			Rails.logger.info "Downloaded and Saved to ActiveStorage! hurray!"

			# driver.quit
		end
  end
end
