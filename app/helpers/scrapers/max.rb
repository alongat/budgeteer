# frozen_string_literal: true

# typed: true

module Scrapers
  class Max < Scraper
		extend T::Sig
		ACCOUNT_NAME = 'MAX Credit Card'
		CAL_START_URL = 'https://services.cal-online.co.il/card-holders/Screens/AccountManagement/HomePage.aspx'
		CAL_TRANSACTIONSֹֹ_PAGE = 'https://services.cal-online.co.il/Card-Holders/Screens/Transactions/Transactions.aspx'
		# https://onlinelcapi.max.co.il/api/registered/transactionDetails/getTransactionsAndGraphs?filterData={%22userIndex%22:-1,%22cardIndex%22:-1,%22monthView%22:true,%22date%22:%222020-01-01%22,%22dates%22:{%22startDate%22:%220%22,%22endDate%22:%220%22}}&firstCallCardIndex=-1&v=V3.29-HF.7.7
		def login(driver)
			driver.get(CAL_START_URL)
			wait = Selenium::WebDriver::Wait.new(:timeout => 10)
			wait.until { driver.title.start_with? "כניסה לחשבון" }
			sleep(2)
			driver.switch_to().frame('calconnectIframe')
			driver.find_element(id: 'txt-login-username').send_keys(ENV['VISA_CAL_USERNAME'])
			driver.find_element(id: 'txt-login-password').send_keys(ENV['VISA_CAL_PASSWORD'])
			driver.find_element(xpath: "//button[@type='submit']").click
		end

		# TODO: Need to fix XLS files, the parser only works with XLSX, BUT looks like the file is CSV...
		def download_xls_files(driver, from_date, to_date)
			driver.get(CAL_TRANSACTIONSֹֹ_PAGE)
			driver.find_element(id: DATE_SCOPE_ELEMENT).click
			elements_to_click = driver.find_elements(xpath: "//ul[@id='#{DATE_LIST_ELEMENT}']/li").select { |x| 
																	(from_date..to_date).cover?(x.text.to_date)  
																}

			# Download xls
			elements_to_click.each do |x| 
				x.click
				driver.find_element(id: SHOW_BUTTON_ELEMENT).click
				driver.find_element(id: DOWNLOAD_EXCEL_BUTTON).click
				sleep(1) 
				driver.find_element(id: DATE_SCOPE_ELEMENT).click
			end

			elements_to_click.count
		end

		def save_files_to_active_storage(directory)
			Dir.each_child(directory) do |filename| 
				tf = TransactionFile.create!(filename: filename, source: ACCOUNT_NAME)
				tf.files.attach(io: File.open("#{directory}/#{filename}"),
												filename: filename, parsed: false)
			
			end
		end

		def scrape(from_date=Time.now.beginning_of_month, 
								 to_date=Time.now.end_of_month)
			Rails.logger.info 'Scraping Visa Cal!'

			download_dir = "#{Rails.root}/tmp/visacalfiles"
			FileUtils.mkdir_p(download_dir) unless File.directory?(download_dir)

			driver = get_driver(download_dir)
			login(driver)
			Rails.logger.info 'Login successful!'
			sleep(3)
			count = download_xls_files(driver, from_date, to_date)
			Rails.logger.info "Downloaded #{count} files! hurray!"
			driver.quit
			
			Rails.logger.info 'Saving files to ActiveStorage.'
			save_files_to_active_storage(download_dir)
		end
  end
end
